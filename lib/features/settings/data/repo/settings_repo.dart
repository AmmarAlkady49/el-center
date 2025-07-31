import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/data/models/profile_account_model.dart';

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
}
