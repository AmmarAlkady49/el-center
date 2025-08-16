import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';

class RememberMeAndForgotPasswordRow extends StatefulWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  State<RememberMeAndForgotPasswordRow> createState() =>
      _RememberMeAndForgotPasswordRowState();
}

class _RememberMeAndForgotPasswordRowState
    extends State<RememberMeAndForgotPasswordRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Clean Remember Me
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: isChecked ? AppColors.mainBlue : Colors.white,
                  border: Border.all(
                      color:
                          isChecked ? AppColors.mainBlue : Colors.grey.shade400,
                      width: 1.5.w),
                ),
                child: isChecked
                    ? Icon(
                        Icons.check,
                        size: 15.sp,
                        color: Colors.white,
                      )
                    : null,
              ),
              SizedBox(width: 12.w),
              Text(
                S.of(context).rememberMe,
                style: FontHelper.font15BlackW600(context)
                    .copyWith(color: Colors.grey.shade700, fontSize: 13.sp),
              ),
            ],
          ),
        ),

        // Clean Forgot Password
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).forgotPassword,
            style: FontHelper.font15BlackW600(context)
                .copyWith(color: AppColors.mainBlue, fontSize: 13.sp),
          ),
        ),
      ],
    );
  }
}
