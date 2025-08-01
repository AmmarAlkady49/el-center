import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:e_learning_app/core/data/models/standard_response_body.dart';
import 'package:e_learning_app/core/networking/api_result.dart';

import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';
import '../models/add_course_review_request_body.dart';

class CourseDetailsRepo {
  final ApiService apiService;

  CourseDetailsRepo(this.apiService);

  Future<bool> isEnrolled(int courseId) async {
    try {
      final response = await apiService.isEnrolled({"courseId": courseId});
      return response;
    } catch (error) {
      return false;
    }
  }

  Future<List<CourseModuleModel>> getAllCourseModules(int courseId) async {
    try {
      final response =
          await apiService.getAllCourseModules({"courseId": courseId});
      return response;
    } catch (error) {
      return [];
    }
  }

  Future<ApiResult<List<LessonModule>?>> getModuleLessons(int moduleId) async {
    try {
      final response =
          await apiService.getModuleLessons({"moduleId": moduleId});
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CourseReviewModel>>> getCourseReviews(
      int courseId) async {
    try {
      final response = await apiService.getCourseReviews(courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> createCourseReview(
      int courseId, String review, int rating) async {
    try {
      final response =
          await apiService.addCourseReview(AddCourseReviewRequestBody(
        courseId: courseId,
        rating: rating,
        reviewContent: review,
      ));
      return ApiResult.success(response.message);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<StandardResponseBody>> applyCoupon(
      String couponCode, int courseId) async {
    try {
      final response = await apiService.applyCoupon(couponCode, courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> enrollmentEnroll(int courseId) async {
    try {
      final response = await apiService.enrollmentEnroll(courseId);
      return ApiResult.success(response);
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
