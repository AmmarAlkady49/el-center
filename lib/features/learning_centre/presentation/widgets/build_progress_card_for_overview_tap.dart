import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildProgressCardForOverviewTap extends StatelessWidget {
  final LearningCentreCubit cubit;
  const BuildProgressCardForOverviewTap({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final progress = cubit.lessons!.isEmpty
        ? 0.0
        : cubit.completedLessonIds.length / cubit.lessons!.length;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey.withAlpha(60)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.trending_up_rounded,
                    color: AppColors.mainBlue,
                    size: 20.sp,
                  ),
                  horizontalSpacing(8.w),
                  Text(
                    S.of(context).your_progress,
                    style: FontHelper.font20BlackW700(context).copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.withAlpha(30),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${(progress * 100).toInt()}%',
                  style: FontHelper.font14BlackW500(context).copyWith(
                    color: AppColors.mainBlue,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing(16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.grey.withAlpha(100),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
              minHeight: 8.h,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          verticalSpacing(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${cubit.completedLessonIds.length} ${S.of(context).of_of} ${cubit.lessons!.length} ${S.of(context).lessons_completed}',
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                '${cubit.lessons!.length - cubit.completedLessonIds.toList().length} ${S.of(context).remaining}',
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
