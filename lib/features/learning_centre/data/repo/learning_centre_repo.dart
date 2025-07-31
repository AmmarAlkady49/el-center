import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/data/models/completed_lesson_model.dart';
import '../../../../core/data/models/standard_response_body.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../model/quiz_model.dart';

class LearningCentreRepo {
  final ApiService apiService;

  LearningCentreRepo(this.apiService);

  Future<ApiResult<List<QuizModel>>> getAllCourseQuizzes(int courseId) async {
    try {
      final response = await apiService.getAllCourseQuizzes(courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<StandardResponseBody>> completeLesson(int lessonId) async {
    try {
      final response = await apiService.completeLesson(lessonId);
      return ApiResult.success(response);
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<List<CompletedLessonModel>> getCompletedLessons(int courseId) async {
    try {
      final response = await apiService.getCompletedLessons(courseId);
      return response;
    } catch (error) {
      throw ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
