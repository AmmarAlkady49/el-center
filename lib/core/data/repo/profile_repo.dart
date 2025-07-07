import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../networking/api_error_handler.dart';
import '../models/profile_account_model.dart';

class ProfileRepo {
  final ApiService apiService;

  ProfileRepo(this.apiService);

  Future<ApiResult<ProfileAccountModel>> getProfile() async {
    try {
      final reposne = await apiService.getProfile();
      return ApiResult.success(reposne);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
