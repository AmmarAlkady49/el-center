import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class TitleSignOfAuthPages extends StatelessWidget {
  const TitleSignOfAuthPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).signinToYourAccount,
            style: FontHelper.font36WhiteW700(context),
          ),
          verticalSpacing(4),
          RichText(
            text: TextSpan(
              text: "${S.of(context).dontHaveAnAccount} ",
              style: FontHelper.font16WhiteW500(context).copyWith(
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: S.of(context).signup,
                  style: FontHelper.font16WhiteW600(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
