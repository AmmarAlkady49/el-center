import 'package:dio/dio.dart';

import '../../../../core/data/models/course_enrollments_response_model.dart';
import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/data/models/standard_response_body.dart';
import '../../../../core/networking/api_service.dart';

class InstructorHomeRepo {
  final ApiService apiService;

  InstructorHomeRepo({required this.apiService});

  Future<ProfileAccountModel> getProfile() async {
    try {
      final apiResponse = await apiService.getProfile();
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }

  Future<List<CourseInfoModel>> getAllApprovedInstructorCourses(
      String instructorId) async {
    try {
      final apiResponse =
          await apiService.getAllApprovedInstructorCourses(instructorId);
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to fetch courses: $e');
    }
  }

  Future<int> getStudentsCount(int courseId) async {
    try {
      final apiResponse = await apiService.getStudentsCount(courseId);
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to fetch students count: $e');
    }
  }

  Future<StandardResponseBody> addCourse({
    required String title,
    required String description,
    required String requirements,
    required double price,
    required MultipartFile thumbnailFile,
    required bool isActive,
    required int durationInHours,
    required int categoryId,
    required bool useAIAssistant,
    required String courseLanguage,
  }) async {
    try {
      return await apiService.addCourse(
        title,
        description,
        requirements,
        price,
        thumbnailFile, 
        isActive,
        durationInHours,
        categoryId,
        useAIAssistant,
        courseLanguage,
      );
    } catch (e) {
      throw Exception('Failed to add course: $e');
    }
  }

  Future<List<CourseEnrollmentsResponseModel>> getCourseEnrollments(
      int courseId) async {
    try {
      return await apiService.getCourseEnrollments(courseId);
    } catch (e) {
      throw Exception('Failed to fetch course enrollments: $e');
    }
  }

  Future<StandardResponseBody> updateCourse({
    required int id,
    required String title,
    required String description,
    required String requirements,
    required double price,
    required MultipartFile? thumbnailFile,
    required bool isActive,
    required int durationInHours,
    required int categoryId,
    required bool useAIAssistant,
    required String courseLanguage,
  }) async {
    try {
      return await apiService.updateCourse(
        id,
        title,
        description,
        requirements,
        price,
        thumbnailFile, 
        isActive,
        durationInHours,
        categoryId,
        useAIAssistant,
        courseLanguage,
      );
    } catch (e) {
      throw Exception('Failed to update course: $e');
    }
  }
}
