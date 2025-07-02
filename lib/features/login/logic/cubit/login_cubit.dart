import 'package:e_learning_app/features/login/data/models/login_request_body.dart';
import 'package:e_learning_app/features/login/data/repo/login_repo.dart';
import 'package:e_learning_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    try {
      final response = await loginRepo.login(loginRequestBody);
      emit(LoginState.success(response));
    } catch (error) {
      emit(LoginState.error(error: error.toString()));
    }
  }

  // Function to validate email
  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourEmail;
    }

    // Basic pattern for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return S.of(context).pleaseEnterAvalidEmail;
    }

    return null;
  }

  // Function to validate password
  String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourPassword;
    }

    final password = value.trim();

    // Minimum 8 characters, at least one uppercase, one lowercase, one number, one special character
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~_])[A-Za-z\d!@#\$&*~_]{8,}$',
    );

    if (!passwordRegex.hasMatch(password)) {
      return S.of(context).pleaseEnterAvalidPassword;
    }

    return null;
  }
}
