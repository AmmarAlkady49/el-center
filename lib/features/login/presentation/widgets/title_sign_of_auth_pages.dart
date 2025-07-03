import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/font_helper.dart';

class TitleSignOfAuthPages extends StatelessWidget {
  final String title;
  final String normalSubtitle;
  final String clickableText;
  final bool? isRegister;
  const TitleSignOfAuthPages(
      {super.key,
      required this.title,
      required this.normalSubtitle,
      required this.clickableText,
      this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FontHelper.font31WhiteW800(context).copyWith(
              letterSpacing: -0.5,
              height: 1.2,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          verticalSpacing(8),
          RichText(
            text: TextSpan(
              text: normalSubtitle,
              style: FontHelper.font16WhiteW500(context)
                  .copyWith(color: Colors.white70),
              children: [
                TextSpan(
                  text: clickableText,
                  style: FontHelper.font16WhiteW600(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      isRegister!
                          ? context.pop()
                          : context
                              .pushNamedAndRemoveUntil(AppRoutes.signUpScreen);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
