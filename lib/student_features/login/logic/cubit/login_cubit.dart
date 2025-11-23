import 'dart:developer';

import 'package:e_learning_app/core/helpers/shared_pref_helper.dart';
import 'package:e_learning_app/core/networking/dio_factory.dart';
import 'package:e_learning_app/student_features/login/data/models/login_request_body.dart';
import 'package:e_learning_app/student_features/login/data/repo/login_repo.dart';
import 'package:e_learning_app/student_features/login/logic/cubit/login_state.dart';

import 'package:e_learning_app/core/networking/api_result.dart' as api_result;
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../../../core/data/repo/profile_repo.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/login_response_body.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final ProfileRepo profileRepo;
  LoginCubit(this.loginRepo, this.profileRepo) : super(LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());

    try {
      // Step 1: Attempt login
      final response = await loginRepo.login(loginRequestBody);

      if (response is api_result.Failure<LoginResponseBody>) {
        log("Error while logging in1: ${response.error.apiErrorModel.message}");
        emit(LoginState.error(error: response.error.apiErrorModel.message!));
        return;
      }

      if (response is api_result.Success<LoginResponseBody>) {
        // Step 2: Save token
        await saveUserToken(response.data.message);

        // Step 3: Fetch profile
        final profileData = await profileRepo.getProfile();
        String userType;

        if (profileData is api_result.Success<ProfileAccountModel>) {
          final userTypeValue = profileData.userType;
          await SharedPrefHelper.setData('userType', userTypeValue);
          userType = userTypeValue;
        } else {
          const defaultType = "Student";
          await SharedPrefHelper.setData('userType', defaultType);
          userType = defaultType;
        }

        // Step 4: Emit success
        emit(LoginState.success(userType == "Student"));
      }
    } catch (error) {
      log("Error while logging in2: $error");
      emit(LoginState.error(error: error.toString()));
    }
  }

  Future<void> signinWithGoogle() async {
    emit(LoginState.googleLoginLoading());

    try {
      await loginRepo.signinWithGoogle();

      final profileData = await profileRepo.getProfile();
      String userType;

      if (profileData is api_result.Success<ProfileAccountModel>) {
        final userTypeValue = profileData.userType;
        await SharedPrefHelper.setData('userType', userTypeValue);
        userType = userTypeValue;
      } else {
        const defaultType = "Student";
        await SharedPrefHelper.setData('userType', defaultType);
        userType = defaultType;
      }

      emit(LoginState.googleLoginSuccess(userType == "Student"));
    } catch (error) {
      log("Error during Google sign-in: $error");
      emit(LoginState.googleLoginError(error: error.toString()));
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString("token", token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  // Function to validate email
  String? validateEmail(String? email, BuildContext context) {
    if (email == null || email.isEmpty) {
      return S.of(context).pleaseEnterYourEmail;
    }
    if (!email.contains("@")) {
      return S.of(context).pleaseEnterAvalidEmail;
    }
    return null;
  }

  String? validatePassword(String? pass, BuildContext context) {
    if (pass == null || pass.isEmpty) {
      return S.of(context).pleaseEnterYourPassword;
    }
    if (pass.length < 6) {
      return S.of(context).passwordTooWeak;
    }
    return null;
  }
}
