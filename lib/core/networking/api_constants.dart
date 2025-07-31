import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiBaseUrl = "https://elcentre-api.runasp.net/";
  static const String baseUrlOfTheImage =
      "https://elcentre-learn.vercel.app/api";

  static const String login = "Account/login";
  static const String register = "Account/register";
  static const String activeAccount = "Account/active-account";
  static const String profile = "Account/profile";
  static const String getAllCourses = "Course/get-all-courses";
  static const String getCourse = "Course/get-course";
  static const String isEnrolled = "Enrollment/is-enrolled";
  static const String getAllCourseModules =
      "/CourseModule/get-all-course-modules";
  static const String getModuleLessons = "Lesson/get-module-lessons";
  static const String createPaymentToken = "Payment/create-payment-token";
  static const String getCourseReview = "CourseReview/get-course-review";
  static const String addCourseReview = "CourseReview/add-course-review";
  static const String getAllCourseQuizzes = "/Quiz/get-all-course-quizzes";
  static const String completeLesson = "Enrollment/complete-lesson";
  static const String completedLessons = "Enrollment/completed-lessons";
  static const String getStudentEnrollments =
      "/Enrollment/get-student-enrollments";
  static const String applyCoupon =
      "/CouponCode/apply-coupon-code";
      static const String getAllCategories = "/Category/get-all-categories";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

abstract class ParseErrorLogger {
  void logError(
      Object error, StackTrace stackTrace, RequestOptions requestOptions);
}
