import 'package:e_learning_app/core/data/models/category_model.dart';
import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/data/models/completed_lesson_model.dart';
import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/paginated_course_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../my_courses/data/model/student_enrollments_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<PaginatedCourseResponse> getAllCourses() async {
    try {
      final response = await apiService.getAllCourses();

      return response;
    } catch (error) {
      throw "Failed to fetch all courses ${error.toString()}";
    }
  }

  Future<ApiResult<List<CourseInfoModel>>> getCoursesByCategory(
      int category) async {
    try {
      final query = {"categoryId": category};
      final response = await apiService.getCoursesByCategory(query);

      final parsed = PaginatedCourseResponse.fromJson(response);
      return ApiResult.success(parsed.data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // to get student activities

  Future<List<StudentEnrollmentsModel>> getStudentEnrollments() async {
    try {
      return await apiService.getStudentEnrollments();
    } catch (e) {
      throw Exception('Failed to fetch student enrollments: $e');
    }
  }

  Future<List<CompletedLessonModel>> getCompletedLessons(int courseId) async {
    try {
      // final response = await apiService.getCompletedLessons(courseId);
      return await apiService.getCompletedLessons(courseId) ?? [];
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

Future<ApiResult<List<CategoryModel>>> getAllCategories() async {
  try {
    final response = await apiService.getAllCategories();
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ErrorHandler.handle(error));
  }
}

}
