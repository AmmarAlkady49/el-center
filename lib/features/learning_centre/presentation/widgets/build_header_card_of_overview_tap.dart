import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_cubit.dart';

class BuildHeaderCardOfOverviewTap extends StatelessWidget {
  final LearningCentreCubit cubit;
  const BuildHeaderCardOfOverviewTap(
      {super.key,required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              horizontalSpacing(8),
              Text(
                S.of(context).about_this_course,
                style: FontHelper.font20BlackW700(context).copyWith(
                  color: Colors.white,
                  fontSize: 15.sp,
                  wordSpacing: -1,
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          Text(
            cubit.conurseInfo?.title ?? 'Course Title',
            style: FontHelper.font20BlackW700(context).copyWith(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
