import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/student_features/login/presentation/widgets/email_and_password_text_form_field.dart';
import 'package:e_learning_app/student_features/login/presentation/widgets/google_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/login_cubit.dart';
import '../widgets/header_background_login_widgets.dart';
import '../widgets/login_bloc_consumer.dart';
import '../widgets/or_login_with_widget.dart';
import '../widgets/remember_me_and_forget_password_row.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250.h, child: HeaderBackground()),
              SizedBox(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailAndPasswordTextFormField(cubit: cubit),
                    verticalSpacing(20),
                    RememberMeAndForgotPasswordRow(),
                    verticalSpacing(18),
                    SizedBox(
                      width: double.infinity,
                      child: LoginBlocConsumer(cubit: cubit),
                    ),
                    verticalSpacing(20),
                    const OrLoginWithWidget(),
                    verticalSpacing(20),
                    GoogleLoginButton(cubit: cubit),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
