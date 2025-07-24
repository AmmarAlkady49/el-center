import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_review_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildAiAssistant extends StatelessWidget {
  final List<CourseReviewModel> courseReviews;
  const BuildAiAssistant({super.key, required this.courseReviews});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainBlue.withAlpha(50),
                    AppColors.mainBlue.withAlpha(25),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Iconsax.cpu_charge,
                size: 48.sp,
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpacing(16),
            Text(
              S.of(context).ai_assistant,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 18.sp,
              ),
            ),
            verticalSpacing(8),
            Text(
              'Coming Soon',
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.greyBlue,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
