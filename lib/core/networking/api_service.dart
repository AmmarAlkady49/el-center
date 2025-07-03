import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/data/login_signup_response_body.dart';
import 'package:retrofit/http.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/signup/data/models/signup_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginSignupResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<LoginSignupResponseBody> register(@Body() SignupRequestBody signupRequestBody);

}
