import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/data/models/course_review_model.dart';

part 'course_details_state.freezed.dart';

@Freezed()
abstract class CourseDetailsState with _$CourseDetailsState {
  const factory CourseDetailsState.initial() = _Initial;
  const factory CourseDetailsState.courseDetailsLoading() =
      CourseDetailsLoading;
  const factory CourseDetailsState.courseDetailsLoaded({
    required bool isEnrolled,
    required List<CourseModuleModel> courseModules,
    required List<CourseModulesWithLessons> modulesWithLessons,
    required List<CourseReviewModel> courseReviews,
  }) = CourseDetailsLoaded;
  const factory CourseDetailsState.courseDetailsLoadedError({
    required String error,
  }) = CourseDetailsLoadedError;
  const factory CourseDetailsState.paymentLoading() = PaymentLoading;
  const factory CourseDetailsState.paymentSuccess(
      Map<String, String> redirectData) = PaymentSuccess;
  const factory CourseDetailsState.freePaymentSuccess(
      {required String message}) = FreePaymentSuccess;
  const factory CourseDetailsState.paymentFailure({
    required String error,
  }) = PaymentFailure;
  const factory CourseDetailsState.paymentRedirectUrl(String url) =
      PaymentRedirectUrl;
  const factory CourseDetailsState.courseReviewLoading() = CourseReviewLoading;
  const factory CourseDetailsState.courseReviewSuccess(String review) =
      CourseReviewSuccess;
  const factory CourseDetailsState.courseReviewFailure({
    required String error,
  }) = CourseReviewFailure;

  const factory CourseDetailsState.couponLoading() = CouponLoading;
  const factory CourseDetailsState.couponSuccess(String returnFinalPrice) =
      CouponSuccess;
  const factory CourseDetailsState.couponFailure({
    required String error,
  }) = CouponFailure;

  const factory CourseDetailsState.enrollmentLoading() = EnrollmentLoading;
  const factory CourseDetailsState.enrollmentSuccess(String message) =
      EnrollmentSuccess;
  const factory CourseDetailsState.enrollmentFailure({
    required String error,
  }) = EnrollmentFailure;

  const factory CourseDetailsState.updateCourseReviewSuccess(String message) =
      UpdateCourseReviewSuccess;
  const factory CourseDetailsState.updateCourseReviewFailure({
    required String error,
  }) = UpdateCourseReviewFailure;

  const factory CourseDetailsState.loadingVideo() = LoadingVideo;

  const factory CourseDetailsState.videoLoaded() = VideoLoaded;

  const factory CourseDetailsState.videoLoadFailed({required String error}) =
      VideoLoadFailed;

  const factory CourseDetailsState.loadingTextContent() = LoadingTextContent;

  const factory CourseDetailsState.successTextContent() = SuccessTextContent;

  const factory CourseDetailsState.failedTextContent() = FailedTextContent;
}
