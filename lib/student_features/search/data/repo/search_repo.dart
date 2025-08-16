import 'dart:developer';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/search_request_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo({required ApiService apiService}) : _apiService = apiService;

  Future<ApiResult<List<CourseInfoModel>>> searchForCourses(
      SearchRequestModel searchQuery) async {
    try {
      final queryMap = searchQuery.toJson()
        ..removeWhere((key, value) => value == null);
      final response = await _apiService.searchCourses(queryMap);

      return ApiResult.success(response.data);
    } catch (error) {
      log(error.toString());
      throw ApiResult.failure(ErrorHandler.handle(error.toString()));
    }
  }
}
