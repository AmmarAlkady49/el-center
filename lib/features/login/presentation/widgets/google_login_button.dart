import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: Colors.grey.shade500,
              width: 1.3.w,
            ),
          ),
        ),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black12),
        shadowColor: WidgetStateProperty.all<Color>(Colors.black45),
        elevation: WidgetStateProperty.all<double>(4.0),
      ),
      child: SizedBox(
        height: 52.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/auth/google_logo.svg',
              width: 24.w,
              height: 24.h,
            ),
            horizontalSpacing(5),
            Text(
              S.of(context).continueWithGoogle,
              style: FontHelper.font16WhiteW600(context).copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
