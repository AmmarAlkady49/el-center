import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/widgets/app_text_button.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/email_and_password_text_form_field.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/google_login_button.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/title_sign_of_auth_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../widgets/or_login_with_widget.dart';
import '../widgets/remember_me_and_forget_password_row.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBlue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/Untitled_design.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSignOfAuthPages(),
                  ],
                ),
              ),
              Positioned(
                top: 280.h,
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
                        child: AppTextButton(
                          text: S.of(context).signin,
                          onPressed: () {},
                        ),
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
