import 'package:e_learning_app/student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildInstructorCardForOverviewTap extends StatelessWidget {
  final LearningCentreCubit cubit;

  const BuildInstructorCardForOverviewTap({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey.withAlpha(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Instructor Image
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainBlue, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(40),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: cubit.conurseInfo?.instructorImage != null
                  ? Image.network(
                      "${ApiConstants.baseUrlOfTheImage}${cubit.conurseInfo!.instructorImage!}",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildDefaultAvatar(),
                    )
                  : _buildDefaultAvatar(),
            ),
          ),
          horizontalSpacing(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).instructor,
                  style: FontHelper.font14BlackW500(context).copyWith(
                    color: AppColors.greyBlue,
                    fontSize: 12.sp,
                  ),
                ),
                verticalSpacing(4.h),
                Text(
                  cubit.conurseInfo?.instructorName ?? 'Instructor Name',
                  style: FontHelper.font20BlackW700(context).copyWith(
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.withAlpha(30),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_rounded,
                  color: AppColors.mainBlue,
                  size: 16.sp,
                ),
                horizontalSpacing(4),
                Text(
                  S.of(context).verified,
                  style: FontHelper.font14BlackW500(context).copyWith(
                    color: AppColors.mainBlue,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.mainBlue, AppColors.secondaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 30.sp,
      ),
    );
  }
}
