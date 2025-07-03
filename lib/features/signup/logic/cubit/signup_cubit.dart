import 'package:e_learning_app/features/signup/data/repo/signup_repo.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_state.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/signup_request_body.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupState.initial());

  String selectedGender = "male";
  String selectedCountryCode = "+20";
  String selectedRole = "Student";
  String dateOfBirth = "2002-08-05";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? validateFirstAndLastName(String? value, BuildContext context,
      {bool isFirstName = false}) {
    if (value == null || value.trim().isEmpty) {
      return isFirstName
          ? S.of(context).pleaseEnterYourFirstName
          : S.of(context).pleaseEnterYourLastName;
    }
    return null;
  }

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

  String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourPhoneNumber;
    }
    if (value.length != 10 || !RegExp(r'^\d+$').hasMatch(value)) {
      return S.of(context).pleaseEnterAvalidPhoneNumber;
    }
    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourPassword;
    }
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(value)) {
      return S.of(context).passwordTooWeak;
    }

    return null;
  }

  String? validateConfirmPassword(
    String? value,
    String password,
    BuildContext context,
  ) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourConfirmPassword;
    }
    if (value != password) {
      return S.of(context).passwordsDoNotMatch;
    }
    return null;
  }

  Future<void> emitSignupState() async {
    emit(SignupState.loading());
    try {
      final response = await signupRepo.register(SignupRequestBody(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        gender: selectedGender,
        userType: selectedRole,
        dateOfBirth: dateOfBirth,
      ));
      emit(SignupState.success(response));
    } catch (error) {
      emit(SignupState.error(error: error.toString()));
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    selectedGender = "male";
    selectedCountryCode = "+20";
    selectedRole = "Student";
    dateOfBirth = "2002-08-05";
  }
}
