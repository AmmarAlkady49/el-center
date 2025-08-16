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
      listenWhen: (previous, current) => current is Success || current is Error,
      buildWhen: (previous, current) => current is Loading || current is Error,
      listener: (context, state) {
        if (state is Success) {
          state.isStudent
              ? Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.studentBottomNavigation, (route) => false)
              : Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.instructorBottomNavigation, (route) => false);
        }
        if (state is Error) {
          log("❌ Error: ${state.error}");
          return HelperDialogs.showError(state.error, context);
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return AppTextButton(
            onPressed: null,
            text: S.of(context).loading,
            isLoading: true,
          );
        }
        if (state is Error) {
          return AppTextButton(
              text: S.of(context).tryAgain,
              onPressed: () {
                final emailError =
                    cubit.validateEmail(cubit.emailController.text, context);
                final passwordError = cubit.validatePassword(
                    cubit.passwordController.text, context);

                if (emailError == null && passwordError == null) {
                  cubit.emitLoginState(
                    LoginRequestBody(
                      email: cubit.emailController.text,
                      password: cubit.passwordController.text,
                    ),
                  );
                }
              });
        }
        return AppTextButton(
            text: S.of(context).signin,
            onPressed: () {
              final emailError =
                  cubit.validateEmail(cubit.emailController.text, context);
              final passwordError = cubit.validatePassword(
                  cubit.passwordController.text, context);

              if (emailError == null && passwordError == null) {
                cubit.emitLoginState(
                  LoginRequestBody(
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                  ),
                );
              }
            });
      },
    );
  }
}
