import 'package:e_learning_app/core/networking/api_service.dart';

import '../models/profile_account_model.dart';

class ProfileRepo {
  final ApiService apiService;

  ProfileRepo(this.apiService);

  Future<ProfileAccountModel> getProfile() async {
    try {
      final reposne = await apiService.getProfile();
      return reposne;
    } catch (error) {
      throw "Failed to fetch profile ${error.toString()}";
    }
  }
}
