import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildHeaderOfCourseContent extends StatelessWidget {
  final List<CourseModulesWithLessons> modulesWithLessons;
  const BuildHeaderOfCourseContent({super.key,required this.modulesWithLessons});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue,
            AppColors.mainBlue.withAlpha(200),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(100),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(60),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Iconsax.book_1,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          horizontalSpacing(8),
          Text(
            S.of(context).course_content,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: Colors.white,
              fontSize: 15.sp,
              wordSpacing: -1,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withAlpha(60),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${HelperFunctions.getTotalLessons(modulesWithLessons)} ',
                    style: FontHelper.font36WhiteW700(context).copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  TextSpan(
                    text: '${S.of(context).lessons} • ',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  TextSpan(
                    text: HelperFunctions.getTotalDuration(modulesWithLessons),
                    style: FontHelper.font36WhiteW700(context).copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
