import 'dart:developer';

import 'package:e_learning_app/core/networking/api_error_handler.dart';
import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';
import 'package:e_learning_app/student_features/login/data/models/login_response_body.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../env.dart';
import '../models/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseBody>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<void> signinWithGoogle() async {
    log("Signin with Google called");
    log("Client ID: ${Env.googleWebClientId}");
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId: Env.googleWebClientId,
      );

      // signOut عشان تبدأ fresh
      await googleSignIn.disconnect();

      // دي الطريقة الجديدة (بدل signIn القديمة)
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception('Google sign-in failed: No ID token');
      }

      await sendToBackend(idToken, "Student");
    } catch (e, stack) {
      log('[GoogleSignIn] ERROR: $e');
      log('[GoogleSignIn] STACK TRACE:\n$stack');
      rethrow;
    }
  }

  Future<void> sendToBackend(String idToken, String role) async {
    try {
      final response = await _apiService.googleLogin(role);

      log('Backend response: $response');
    } catch (error) {
      log('Error sending data to backend: $error');
      throw Exception('Failed to send data to backend: $error');
    }
  }
}
