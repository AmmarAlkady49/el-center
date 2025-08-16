// Updated BuildQuizHeaderForQuizzesTap Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildQuizHeaderForQuizzesTap extends StatelessWidget {
  const BuildQuizHeaderForQuizzesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue.withAlpha(50),
                  AppColors.mainBlue.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Iconsax.clipboard_tick,
              size: 32.sp,
              color: AppColors.mainBlue,
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).quizzes,
                  style: FontHelper.font20BlackW700(context).copyWith(
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  S.of(context).complete_lessons_to_unlock,
                  style: FontHelper.font14BlackW500(context).copyWith(
                    color: AppColors.greyBlue,
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
