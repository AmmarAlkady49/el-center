import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_cubit.dart';

class BuildEmptyCoursesList extends StatelessWidget {
  final HomeCubit cubit;
  const BuildEmptyCoursesList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty state illustration
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withAlpha(30),
                    Colors.blue.withAlpha(10),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.school_outlined,
                size: 48.sp,
                color: Colors.blue.withAlpha(175),
              ),
            ),

            SizedBox(height: 24.h),

            // Title
            Text(
              S.of(context).no_courses_available_title,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: Colors.black87,
                wordSpacing: -0.5,
                height: 1.4,
              ),
            ),

            SizedBox(height: 12.h),

            // Description
            Text(
              S.of(context).no_courses_available_body,
              style: FontHelper.font15BlackW400(context).copyWith(
                color: Colors.black38,
                wordSpacing: -0.5,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 32.h),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Browse other categories button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.mainBlue,
                        width: 1.5,
                      ),
                      foregroundColor: AppColors.mainBlue,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.explore_outlined,
                          size: 18.sp,
                          color: AppColors.mainBlue,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          S.of(context).browse_categories,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: AppColors.mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 16.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
