import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/features/login/presentation/widgets/email_and_password_text_form_field.dart';
import 'package:e_learning_app/features/login/presentation/widgets/google_login_button.dart';
import 'package:e_learning_app/features/login/presentation/widgets/title_sign_of_auth_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../widgets/login_bloc_consumer.dart';
import '../widgets/or_login_with_widget.dart';
import '../widgets/remember_me_and_forget_password_row.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        // backgroundColor: AppColors.secondaryBlue,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/background_image.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSignOfAuthPages(
                      title: S.of(context).signinToYourAccount,
                      normalSubtitle: "${S.of(context).dontHaveAnAccount} ",
                      clickableText: S.of(context).signup,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 240.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundWiteColor,
                  ),
                  child: Column(
                    children: [
                      EmailAndPasswordTextFormField(),
                      verticalSpacing(14.h),
                      RememberMeAndForgotPasswordRow(),
                      verticalSpacing(20.h),
                      SizedBox(
                        width: double.infinity,
                        child: LoginBlocConsumer(),
                      ),
                      verticalSpacing(20.h),
                      const OrLoginWithWidget(),
                      verticalSpacing(20.h),
                      GoogleLoginButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
