import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:e_learning_app/student_features/payment/data/repo/payment_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/data/models/standard_response_body.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/updata_course_review_request_body.dart';
import '../../data/repos/course_details_repo.dart';
import 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  final PaymentRepo paymentRepo;
  CourseDetailsCubit(this.courseDetailsRepo, this.paymentRepo)
      : super(CourseDetailsState.initial());

  List<CourseModuleModel> courseModules = [];
  List<CourseReviewModel> courseReviews = [];
  List<CourseModulesWithLessons> modulesWithLessons = [];
  List<CourseReviewModel> courseReview = [];
  final TextEditingController couponController = TextEditingController();
  String couponCode = '';
  String finalPrice = '';
  late String userId;
  bool isEnrolled = false;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  late CourseInfoModel courseInfoModel;

  void getCourseDetails(int courseId, CourseInfoModel courseinfo) async {
    emit(CourseDetailsState.courseDetailsLoading());
    try {
      final userId = await SharedPrefHelper.getString('userId');
      courseInfoModel = courseinfo;
      this.userId = userId;
      final isEnrolledResponse = await courseDetailsRepo.isEnrolled(courseId);
      isEnrolled = isEnrolledResponse;

      final courseModules =
          await courseDetailsRepo.getAllCourseModules(courseId);

      final courseReviewResult =
          await courseDetailsRepo.getCourseReviews(courseId);
      // List<CourseReviewModel> courseReview = [];

      if (courseReviewResult is Success<List<CourseReviewModel>>) {
        courseReview = courseReviewResult.data;
        courseReviews = courseReview;
      } else {
        courseReview = [];
        courseReviews = [];
      }

      // Fetch lessons for each module
      modulesWithLessons = await Future.wait(
        courseModules.map(
          (module) async {
            final lessonsResult =
                await courseDetailsRepo.getModuleLessons(module.id);

            List<LessonModule> lessons = [];

            if (lessonsResult is Success<List<LessonModule>?>) {
              lessons = lessonsResult.data ?? [];
            } else {
              lessons = [];
            }

            return CourseModulesWithLessons(
                courseModules: module, lessons: lessons);
          },
        ),
      );

      emit(CourseDetailsState.courseDetailsLoaded(
        isEnrolled: isEnrolledResponse,
        courseModules: courseModules,
        modulesWithLessons: modulesWithLessons,
        courseReviews: courseReview,
      ));
      modulesWithLessons = modulesWithLessons;
    } catch (error) {
      emit(
          CourseDetailsState.courseDetailsLoadedError(error: error.toString()));
    }
  }

  // payment
  Future<void> emitPaymentState(int courseID, String paymentMethod,
      String? couponCode, int totalPrice) async {
    emit(CourseDetailsState.paymentLoading());

    final result = await paymentRepo.createPaymentToken(
        courseID, paymentMethod, couponCode);

    if (result is Success<Map<String, String>> && totalPrice > 0) {
      emit(CourseDetailsState.paymentRedirectUrl(result.data['redirectUrl']!));
    } else if (result is Success<Map<String, String>> && totalPrice == 0) {
      emit(CourseDetailsState.freePaymentSuccess(
          message: result.data['message']!));
    } else {
      emit(CourseDetailsState.paymentFailure(error: result.toString()));
    }
  }

  // Emit enrollment in a free course.
  Future<void> emitEnrollmentState(int courseID) async {
    emit(CourseDetailsState.enrollmentLoading());
    final result = await courseDetailsRepo.enrollmentEnroll(courseID);
    if (result is Success<String>) {
      emit(CourseDetailsState.enrollmentSuccess(result.data));
    } else {
      emit(CourseDetailsState.enrollmentFailure(error: result.toString()));
    }
  }

  // course review submission
  Future<void> emitCourseReviewState(
      int courseId, String review, int rating) async {
    emit(CourseDetailsState.courseReviewLoading());

    log(userId.toString());
    final result =
        await courseDetailsRepo.createCourseReview(courseId, review, rating);
    log(result.toString());
    if (result is Success<String>) {
      emit(CourseDetailsState.courseReviewSuccess(result.data));
    } else {
      emit(CourseDetailsState.courseReviewFailure(error: result.toString()));
    }
  }

  // apply coupon code for discount
  void emitApplyCouponState(int courseId, String couponCode) async {
    emit(CourseDetailsState.couponLoading());
    try {
      final result = await courseDetailsRepo.applyCoupon(couponCode, courseId);
      if (result is Success<StandardResponseBody>) {
        this.couponCode = couponCode;
        emit(CourseDetailsState.couponSuccess(result.data.message));
      } else if (result is Failure<StandardResponseBody>) {
        emit(CourseDetailsState.couponFailure(
            error: result.error.apiErrorModel.message.toString()));
      }
    } catch (e) {
      emit(CourseDetailsState.couponFailure(error: e.toString()));
    }
  }

  void updateCourseReview(
      UpdateCourseReviewRequestBody updateCourseReviewRequestBody) async {
    try {
      final result = await courseDetailsRepo
          .updateCourseReview(updateCourseReviewRequestBody);
      emit(CourseDetailsState.updateCourseReviewSuccess(result.message));
    } catch (e) {
      emit(CourseDetailsState.updateCourseReviewFailure(error: e.toString()));
    }
  }

  void deleteCourseReview(int reviewId) async {
    try {
      final result = await courseDetailsRepo.deleteCourseReview(reviewId);
      emit(CourseDetailsState.updateCourseReviewSuccess(result.message));
    } catch (e) {
      emit(CourseDetailsState.updateCourseReviewFailure(error: e.toString()));
    }
  }

  // initialize preview lesson
  void initializePreviewLesson(LessonModule lesson) async {
    emit(CourseDetailsState.loadingVideo());

    if (chewieController != null) {
      chewieController!.dispose();
    }
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }

    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(lesson.content!));

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
      emit(CourseDetailsState.videoLoaded(
          // videoPlayerController: videoPlayerController!,
          // chewieController: chewieController!,
          ));
      log('Video loaded successfully');
    } catch (e) {
      log('Error loading video: $e');
      emit(CourseDetailsState.videoLoadFailed(error: e.toString()));
      videoPlayerController?.dispose();
      chewieController?.dispose();
    }
  }

    void initializeText(LessonModule lesson) {
    emit(CourseDetailsState.loadingTextContent());
    if (lesson.content != null) {
      emit(CourseDetailsState.successTextContent());
    } else {
      emit(CourseDetailsState.failedTextContent());
    }
  }
}
