import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiBaseUrl = "https://elcentre-api.runasp.net/";
  static const String baseUrlOfTheImage = "https://elcentre-api.runasp.net/";

  static const String login = "/api/v1/Account/login";
  static const String register = "/api/v1/Account/register";
  static const String activeAccount = "/api/v1/Account/active-account";
  static const String profile = "/api/v1/Account/profile";
  static const String getAllCourses = "/api/v1/Course/get-all-courses";
  static const String getCourse = "/api/v1/Course/get-course";
  static const String isEnrolled = "/api/v1/Enrollment/is-enrolled";
  static const String getAllCourseModules =
      "/api/v1/CourseModule/get-all-course-modules";
  static const String getModuleLessons = "/api/v1/Lesson/get-module-lessons";
  static const String createPaymentToken =
      "/api/v1/Payment/create-payment-token";
  static const String getCourseReview =
      "/api/v1/CourseReview/get-course-review";
  static const String addCourseReview =
      "/api/v1/CourseReview/add-course-review";
  static const String getAllCourseQuizzes =
      "/api/v1/Quiz/get-all-course-quizzes";
  static const String completeLesson = "/api/v1/Enrollment/complete-lesson";
  static const String completedLessons = "/api/v1/Enrollment/completed-lessons";
  static const String getStudentEnrollments =
      "/api/v1/Enrollment/get-student-enrollments";
  static const String applyCoupon = "/api/v1/CouponCode/apply-coupon-code";
  static const String getAllCategories = "/api/v1/Category/get-all-categories";
  static const String enrollmentEnroll = "/api/v1/Enrollment/enroll";
  static const String getAllLessonQuestions =
      "/api/v1/Q_A/get-all-lesson-questions/{lessonId}";
  static const String getAllQuestionAnswers =
      "/api/v1/Q_A/get-all-question-answers/{questionId}";
  static const String sendReport = "/api/v1/Q_A/report-qa";
  static const String deleteAnswer = "/api/v1/Q_A/delete-answer/{answerId}";
  static const String deleteQuestion =
      "/api/v1/Q_A/delete-question/{questionId}";
  static const String markAnswerHelpful = "/api/v1/Q_A/helpful-qa";
  static const String addAnswer = "/api/v1/Q_A/add-answer";
  static const String updateAnswer = "/api/v1/Q_A/update-answer/{answerId}";
  static const String updateQuestion =
      "/api/v1/Q_A/update-question/{questionId}";
  static const String addQuestion = "/api/v1/Q_A/add-question";
  static const String updateCourseReview =
      "/api/v1/CourseReview/update-course-review";
  static const String deleteCourseReview =
      "/api/v1/CourseReview/delete-course-review/{reviewId}";
  static const String updateProfile = "/api/v1/Account/edit-profile";
  // instructor
  static const String getAllApprovedInstructorCourses =
      "/api/v1/Course/get-all-approved-instructor-courses/{instructorId}";
  static const String getStudentsCount =
      "/api/v1/Enrollment/students-count/{courseId}";
  static const String getCourseEnrollments =
      "/api/v1/Enrollment/get-course-enrollments";
  static const String addCourse = "/api/v1/Course/add-course";
  static const String updateCourse = "/api/v1/Course/update-course";
  static const String googleLogin = "/api/v1/Account/google-login";
  static const String logout = "/api/v1/Account/logout";
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
