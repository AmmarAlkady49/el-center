import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class BuildErrorStateForQAndATapBarWidget extends StatelessWidget {
  final String error;
  const BuildErrorStateForQAndATapBarWidget({super.key, required this.error});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: AppColors.red.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.red.withOpacity(0.1),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error Icon Container
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.red.withOpacity(0.1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.red.withOpacity(0.1),
                    blurRadius: 20.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Icon(
                Iconsax.warning_2,
                size: 40.w,
                color: AppColors.red,
              ),
            ),

            SizedBox(height: 24.h),

            // Error Title
            Text(
              'Oops! Something went wrong',
              style: FontHelper.font16BlackW500(context).copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 12.h),

            // Error Message
            Text(
              error,
              style: FontHelper.font16BlackW500(context).copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(0.7),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            // Retry Button (Optional - you can remove if not needed)
            Container(
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.red.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: TextButton.icon(
                onPressed: () {
                  // Add retry functionality here if needed
                },
                icon: Icon(
                  Iconsax.refresh,
                  size: 16.w,
                  color: AppColors.red,
                ),
                label: Text(
                  'Try Again',
                  style: FontHelper.font16BlackW500(context).copyWith(
                    color: AppColors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
