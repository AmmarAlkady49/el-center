import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/login_request_body.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listenWhen: (previous, current) => current is Success,
      buildWhen: (previous, current) => current is Loading || current is Error,
      listener: (context, state) {
        if (state is Success) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false);
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
        return AppTextButton(
          text: S.of(context).signin,
          onPressed: () {
            final loginCubit = cubit;
            if (loginCubit.formKey.currentState!.validate()) {
              loginCubit.emitLoginState(
                LoginRequestBody(
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text),
              );
            }
          },
        );
      },
    );
  }
}
