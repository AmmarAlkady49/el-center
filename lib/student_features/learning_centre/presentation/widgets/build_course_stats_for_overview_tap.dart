import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_cubit.dart';

class BuildCourseStatsForOverviewTap extends StatelessWidget {
  final LearningCentreCubit cubit;
  const BuildCourseStatsForOverviewTap({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.star_rounded,
            iconColor: Colors.amber,
            title: '${cubit.conurseInfo?.rating ?? 0}/5',
            subtitle: S.of(context).ratings,
          ),
        ),
        horizontalSpacing(12.w),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.access_time_rounded,
            iconColor: AppColors.mainBlue,
            title:
                '${cubit.conurseInfo?.durationInHours ?? 0} ${S.of(context).hours}',
            subtitle: S.of(context).total,
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: _buildStatCard(
            context,
            icon: Icons.category_rounded,
            iconColor: AppColors.darkBlue,
            title: cubit.conurseInfo?.categoryName ?? 'Category',
            subtitle: 'Category',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withAlpha(150)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: iconColor.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20.sp,
            ),
          ),
          verticalSpacing(8.h),
          Text(
            title,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          verticalSpacing(4.h),
          Text(
            subtitle,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
