import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/login_cubit.dart';

class GoogleLoginButton extends StatelessWidget {
  final LoginCubit cubit;
  const GoogleLoginButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.signinWithGoogle();
      },
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.black26,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/auth/google_logo.svg',
              width: 20.w,
              height: 20.h,
            ),
            horizontalSpacing(12.w),
            Text(
              S.of(context).continueWithGoogle,
              style: FontHelper.font16BlackW600(context).copyWith(
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
