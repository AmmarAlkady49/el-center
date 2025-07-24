import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/networking/api_result.dart' as api_result;
import '../../../../core/theming/app_colors.dart';
import '../../data/model/quiz_model.dart';
import '../../data/repo/learning_centre_repo.dart';
import 'learning_centre_state.dart';

class LearningCentreCubit extends Cubit<LearningCentreState> {
  final LearningCentreRepo learningCentreRepo;
  LearningCentreCubit(this.learningCentreRepo)
      : super(LearningCentreState.initial());

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  bool isVideoLoading = true;

  CourseInfoModel? conurseInfo;
  List<LessonModule>? lessons;
  List<QuizModel>? quizzes;
  List<CourseReviewModel>? courseReview;
  List<CourseModulesWithLessons> modulesWithLessons = [];
  int selectedLessonIndex = 0;
  Set<int> expandedModules = {0};
  int selectedmoduleIndex = 0;

  Set<int> completedLessonIds = {};

  void selectContentOfTheCourse({
    required CourseInfoModel courseInfo,
    required List<CourseModulesWithLessons> modulesWithLessons,
    required List<LessonModule> lessons,
    required List<CourseReviewModel> courseReview,
  }) {
    conurseInfo = courseInfo;
    this.lessons = lessons;
    this.modulesWithLessons = modulesWithLessons;
    this.courseReview = courseReview;
  }

  void getCourseContent({
    required CourseInfoModel courseInfo,
    required List<CourseModulesWithLessons> modulesWithLessons,
    required List<CourseReviewModel> courseReview,
  }) async {
    emit(LearningCentreState.loadingCourseContent());
    try {
      selectContentOfTheCourse(
        courseInfo: courseInfo,
        modulesWithLessons: modulesWithLessons,
        lessons: modulesWithLessons.expand((module) => module.lessons).toList(),
        courseReview:  courseReview,
      );
      final List<int> lessonIds =
          await learningCentreRepo.getCompletedLessons(courseInfo.id);
      completedLessonIds = lessonIds.toSet();
      emit(LearningCentreState.successGetCompletedLessons(
        completedLessonIds: completedLessonIds,
      ));
      emit(LearningCentreState.successGetCourseContent(
        courseInfo: courseInfo,
        modulesWithLessons: modulesWithLessons,
      ));
    } catch (error) {
      log(error.toString());
      emit(LearningCentreState.failedGetCourseContent(error: error.toString()));
    }
  }

  void getAllCourseQuizzes(int courseId) async {
    emit(LearningCentreState.gettingQuizzesByCourse());
    try {
      final apiResponse =
          await learningCentreRepo.getAllCourseQuizzes(courseId);

      log(apiResponse.toString());

      if (apiResponse is api_result.Success<List<QuizModel>>) {
        emit(
          LearningCentreState.successGettingQuizzesByCourse(
              quizzes: apiResponse.data),
        );

        quizzes = apiResponse.data;
      } else if (apiResponse is api_result.Failure) {
        emit(LearningCentreState.faieldGettingQuizzedByCourse(
            error: "Failed to get quizzes "));
        quizzes = [];
      }
    } catch (error) {
      log(error.toString());
      emit(
        LearningCentreState.faieldGettingQuizzedByCourse(
            error: error.toString()),
      );
    }
  }

  List<QuizModel> getQuizForSelectedLesson(int selectedLessonIndex) {
    final lesson =
        modulesWithLessons[selectedmoduleIndex].lessons[selectedLessonIndex];
    final selectedLessonID = lesson.id;
    log("selectedLessonID: $selectedLessonID");
    final selectedLessonQuizzes =
        quizzes!.where((quiz) => quiz.lessonId == selectedLessonID).toList();
    emit(LearningCentreState.successGettingQuizzesByCourse(
        quizzes: selectedLessonQuizzes));
    log("from cubit the selectedLessonQuizzes: ${selectedLessonQuizzes.length}");
    return selectedLessonQuizzes;
  }

  void selectLesson(
      {required int selectedmoduleIndex, required int lessonIndex}) {
    final lesson = modulesWithLessons[selectedmoduleIndex].lessons[lessonIndex];

    this.selectedmoduleIndex = selectedmoduleIndex;
    this.selectedLessonIndex = lessonIndex;

    initializeVideo(lesson.content!);
  }

  void toggleModuleExpanded(int index) {
    if (expandedModules.contains(index)) {
      expandedModules.remove(index);
    } else {
      expandedModules.add(index);
    }
    log('toggleModuleExpanded: expandedModules = $expandedModules');
    // Force a new state emission to trigger rebuild
    emit(LearningCentreState.moduleExpandedStateChanged());
  }

  void initializeVideo(String videoUrl) async {
    emit(LearningCentreState.loadingVideo());

    if (chewieController != null) {
      chewieController!.dispose();
    }
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }

    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    try {
      await videoPlayerController!.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        showOptions: true,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.mainBlue,
          handleColor: AppColors.mainBlue,
          backgroundColor: AppColors.grey,
          bufferedColor: AppColors.greyBlue.withAlpha(20),
        ),
        placeholder: Container(
          color: Colors.black.withAlpha(150),
          child: const Center(
            child: CupertinoActivityIndicator(color: AppColors.mainBlue),
          ),
        ),
      );
      emit(LearningCentreState.videoLoaded(
        videoPlayerController: videoPlayerController!,
        chewieController: chewieController!,
      ));
      log('Video loaded successfully');
    } catch (e) {
      log('Error loading video: $e');
      emit(LearningCentreState.videoLoadFailed(error: e.toString()));
      videoPlayerController?.dispose();
      chewieController?.dispose();
    }
  }

  void completeLesson(int lessonId) async {
    try {
      final apiResponse = await learningCentreRepo.completeLesson(lessonId);
      if (apiResponse is api_result.Success) {
        completedLessonIds.add(lessonId);
        emit(LearningCentreState.successCompleteLesson(lessonId: lessonId));
      } else {
        emit(LearningCentreState.failedCompleteLesson(
            error: "failed to complete lesson"));
      }
    } catch (error) {
      emit(LearningCentreState.failedCompleteLesson(error: error.toString()));
    }
  }
}
