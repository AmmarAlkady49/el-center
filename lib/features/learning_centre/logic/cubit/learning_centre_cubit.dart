import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/data/models/completed_lesson_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/networking/api_result.dart' as api_result;
import '../../../../core/theming/app_colors.dart';
import '../../data/model/quiz_model.dart';
import '../../data/repo/learning_centre_repo.dart';
import '../../presentation/screens/ai_chat_bot_page.dart';
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
  LessonModule? currentLesson;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<ChatMessage> messages = [];

  String? scriptContent;
  bool isContentReady = false;


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
    if (modulesWithLessons.isNotEmpty &&
        modulesWithLessons[0].lessons.isNotEmpty) {
      currentLesson = modulesWithLessons[0].lessons[0];
    } else {
      currentLesson = null;
    }
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
        courseReview: courseReview,
      );
      final List<CompletedLessonModel> lessons =
          await learningCentreRepo.getCompletedLessons(courseInfo.id);

      completedLessonIds = lessons.map((lesson) => lesson.lessonId).toSet();

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

  // initalize groq ai assistant
  void sendMessageToGroq(String userMessage) async {
  
  if (!isContentReady || scriptContent == null || scriptContent!.isEmpty) {
    log("Content not ready for AI chat");
    emit(LearningCentreState.failedSendMessageToGroqAi(
      error: "Please wait for the lesson content to load completely before asking questions."
    ));
    return;
  }
  
  emit(LearningCentreState.loadingSendMessageToGroqAi());
  try {
    final response = await learningCentreRepo.sendMessageToGroq(
      userMessage,
      scriptContent!,
    );
    final aiResponse = response.data['choices'][0]['message']['content'];
    log("aiResponse: $aiResponse");
    emit(
      LearningCentreState.successSendMessageToGroqAi(response: aiResponse),
    );
  } catch (error) {
    log(error.toString());
    emit(
      LearningCentreState.failedSendMessageToGroqAi(error: error.toString()),
    );
  }
}

  void clearMessages() {
    messages.clear();
    // Emit a state to trigger UI rebuild
    emit(LearningCentreState.chatCleared());
    log('Chat messages cleared');
  }

  // transcription video
  Future<void> transcribeVideo(String videoUrl, LessonModule lesson) async {
  log("here where transcribe video called");
  isContentReady = false;
  emit(LearningCentreState.contentNotReady()); // You'll need to add this state
  
  if (lesson.contentType == 'text') {
    scriptContent = lesson.content ?? '';
    isContentReady = true;
    log("text transcripts: $scriptContent");
    log("lesson content: ${lesson.content}");
    emit(LearningCentreState.contentReady()); // You'll need to add this state
    return;
  }
  
  emit(LearningCentreState.loadingTranscribeVideo());
  try {
    final transcriptStringResult =
        await learningCentreRepo.transcribeVideoFromUrl(videoUrl);
    scriptContent = transcriptStringResult;
    isContentReady = true;
    log("scriptContent after transcription: $transcriptStringResult");
    emit(LearningCentreState.successTranscribeVideo(
        transcriptString: transcriptStringResult));
    emit(LearningCentreState.contentReady()); // Signal that content is ready

    log("inside transcribe video: $scriptContent");
  } catch (error) {
    log(error.toString());
    isContentReady = false;
    emit(LearningCentreState.failedTranscribeVideo(error: error.toString()));
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

  Future<void> selectLesson(
      {required int selectedmoduleIndex, required int lessonIndex}) async {
    final lesson = modulesWithLessons[selectedmoduleIndex].lessons[lessonIndex];

    if (chewieController != null) {
      chewieController!.dispose();
      chewieController = null;
    }
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
      videoPlayerController = null;
    }

    // Clear previous transcript
    scriptContent = '';

    this.selectedmoduleIndex = selectedmoduleIndex;
    selectedLessonIndex = lessonIndex;
    currentLesson = lesson;
    log(currentLesson!.title!);
    emit(LearningCentreState.lessonSelected());

    // Handle both video and text content
    if (lesson.contentType == 'video' && lesson.content != null) {
      initializeVideo(lesson.content!);
      await transcribeVideo(lesson.content!, lesson);
    } else if (lesson.contentType == 'text') {
      // ✅ this to handle text content
      await transcribeVideo(lesson.content!, lesson);
    }
    log('transcriptString before sending: $scriptContent');
  }

  @override
  Future<void> close() {
    // Dispose video controllers when cubit is closed
    chewieController?.dispose();
    videoPlayerController?.dispose();
    return super.close();
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

  void initializeText(LessonModule lesson) {
    emit(LearningCentreState.loadingTextContent());
    if (lesson.content != null) {
      emit(LearningCentreState.successTextContent());
    } else {
      emit(LearningCentreState.failedTextContent());
    }
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
