import 'dart:developer';

import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/login_request_body.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocConsumer extends StatelessWidget {
  final LoginCubit cubit;
  const LoginBlocConsumer({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listenWhen: (previous, current) =>
          current is Success ||
          current is Error ||
          current is GoogleLoginSuccess ||
          current is GoogleLoginError,
      buildWhen: (previous, current) => current is! Success,
      listener: (context, state) {
        state.whenOrNull(
          success: (isStudent) {
            log("✅ Login successful - User type: ${isStudent ? 'Student' : 'Instructor'}");
            _navigateBasedOnUserType(context, isStudent);
          },
          error: (error) {
            log("❌ Login Error: $error");
            HelperDialogs.showError(error, context);
          },
          googleLoginSuccess: (isStudent) {
            log("✅ Google Login successful - User type: ${isStudent ? 'Student' : 'Instructor'}");
            _navigateBasedOnUserType(context, isStudent);
          },
          googleLoginError: (error) {
            log("❌ Google Login Error: $error");
            HelperDialogs.showError(error, context);
          },
        );
      },
      builder: (context, state) {
        // Handle loading state
        if (state is Loading) {
          return AppTextButton(
            onPressed: null,
            text: S.of(context).loading,
            isLoading: true,
          );
        }

        // Handle error state with retry
        if (state is Error) {
          return AppTextButton(
            text: S.of(context).tryAgain,
            onPressed: () => _attemptLogin(context),
          );
        }

        // Handle Google login error state
        if (state is GoogleLoginError) {
          return AppTextButton(
            text: S.of(context).tryAgain,
            onPressed: () => _attemptLogin(context),
          );
        }

        // Default sign-in button
        return AppTextButton(
          text: S.of(context).signin,
          onPressed: () => _attemptLogin(context),
        );
      },
    );
  }

  /// Navigate user based on their account type
  void _navigateBasedOnUserType(BuildContext context, bool isStudent) {
    final route = isStudent
        ? AppRoutes.studentBottomNavigation
        : AppRoutes.instructorBottomNavigation;

    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  /// Attempt login with validation
  void _attemptLogin(BuildContext context) {
    // Validate form
    final isValid = cubit.formKey.currentState?.validate() ?? false;

    if (!isValid) {
      log("⚠️ Form validation failed");
      return;
    }

    // Unfocus keyboard
    FocusScope.of(context).unfocus();

    log("🔄 Attempting login for: ${cubit.emailController.text.trim()}");

    // Emit login state
    cubit.emitLoginState(
      LoginRequestBody(
        email: cubit.emailController.text.trim(),
        password: cubit.passwordController.text,
      ),
    );
  }
}
