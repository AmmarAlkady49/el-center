import 'package:e_learning_app/core/data/login_signup_response_body.dart';
import 'package:e_learning_app/core/networking/api_error_handler.dart';
import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../models/signup_request_body.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<LoginSignupResponseBody>> register(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.register(signupRequestBody);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
