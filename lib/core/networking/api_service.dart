import 'package:dio/dio.dart';
import 'package:e_learning_app/core/data/models/course_module_model.dart';
import 'package:e_learning_app/core/data/models/profile_account_model.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/features/login/data/models/login_response_body.dart';
import 'package:retrofit/http.dart';

import '../../features/authVerification/data/model/active_account_request_body.dart';
import '../../features/authVerification/data/model/active_account_response_body.dart';
import '../../features/course_details/data/models/add_course_review_request_body.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/signup/data/models/signup_request_body.dart';
import '../../features/signup/data/models/signup_response_body.dart';
import '../data/models/course_review_model.dart';
import '../data/models/lesson_module.dart';

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

  @GET(ApiConstants.profile)
  Future<ProfileAccountModel> getProfile();

  @GET(ApiConstants.getAllCourses)
  Future<dynamic> getAllCourses();

  @GET(ApiConstants.getAllCourses)
  Future<dynamic> getCoursesByCategory(@Queries() Map<String, dynamic> query);

  @GET(ApiConstants.isEnrolled)
  Future<bool> isEnrolled(@Queries() Map<String, dynamic> courseId);

  @GET(ApiConstants.getAllCourseModules)
  Future<List<CourseModuleModel>> getAllCourseModules(
      @Queries() Map<String, dynamic> courseId);

  @GET(ApiConstants.getModuleLessons)
  Future<List<LessonModule>?> getModuleLessons(
      @Queries() Map<String, dynamic> moduleId);

  @POST(ApiConstants.createPaymentToken)
  Future<Map<String, String>> createPaymentToken(
    @Query('courseID') int courseID,
    @Query('paymentMethod') String paymentMethod,
  );

  @GET("${ApiConstants.getCourseReview}/{courseId}")
  Future<List<CourseReviewModel>> getCourseReviews(
    @Path("courseId") int courseId,
  );

  @POST(ApiConstants.addCourseReview)
  Future<LoginResponseBody> addCourseReview(
    @Body() AddCourseReviewRequestBody addCourseReviewRequestBody,
  );
}
