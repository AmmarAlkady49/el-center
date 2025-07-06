import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/features/login/data/models/login_response_body.dart';
import 'package:retrofit/http.dart';

import '../../features/authVerification/data/model/active_account_request_body.dart';
import '../../features/authVerification/data/model/active_account_response_body.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/signup/data/models/signup_request_body.dart';
import '../../features/signup/data/models/signup_response_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<SignupResponseBody> register(
      @Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.activeAccount)
  Future<ActiveAccountResponseBody> acctiveAccount(
      @Body() ActiveAccountRequestBody activeAccountRequestBody);
}
