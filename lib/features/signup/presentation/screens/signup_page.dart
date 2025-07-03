import 'package:e_learning_app/features/signup/presentation/widgets/signup_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/widgets/title_sign_of_auth_pages.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondaryBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryBlue,
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/background_image.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleSignOfAuthPages(
                          title: S.of(context).register,
                          normalSubtitle:
                              "${S.of(context).alreadyHaveAnAccount} ",
                          clickableText: S.of(context).signin,
                          isRegister: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SignupFormContainer(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
