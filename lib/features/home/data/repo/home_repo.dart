import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/paginated_course_response.dart';
import '../../../../core/networking/api_error_handler.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<List<CourseInfoModel>>> getAllCourses() async {
    try {
      final response = await apiService.getAllCourses();

      final parsed = PaginatedCourseResponse.fromJson(response);
      return ApiResult.success(parsed.data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
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
}
