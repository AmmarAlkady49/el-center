
import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: context.screenHeight * 0.05,
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      decoration: BoxDecoration(
        color: AppColors.mainBlue.withAlpha(60),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.loc.changeLanguage,
                style: FontHelper.font18Black45W300(context).copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.language,
                color: AppColors.darkBlue,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
