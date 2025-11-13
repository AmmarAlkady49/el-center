import 'package:e_learning_app/core/data/models/standard_response_body.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/data/models/update_profile_model.dart';

class SettingsRepo {
  final ApiService _apiService;

  SettingsRepo({required ApiService apiService}) : _apiService = apiService;

  Future<ProfileAccountModel> getProfile() async {
    try {
      final apiResponse = await _apiService.getProfile();
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      UpdateProfileModel updateProfileRequestBody) async {
    try {
      final apiResponse = await _apiService.updateProfile(
        updateProfileRequestBody.firstName,
        updateProfileRequestBody.lastName,
        updateProfileRequestBody.phoneNumber,
        updateProfileRequestBody.gender,
        updateProfileRequestBody.dateOfBirth,
        updateProfileRequestBody.bio,
        updateProfileRequestBody.country,
        updateProfileRequestBody.profilePicture,
      );
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  Future<StandardResponseBody> logout() async {
    try {
      final apiResponse = await _apiService.logout();
      return apiResponse;
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}
