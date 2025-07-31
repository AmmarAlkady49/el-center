import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_cubit.dart';

class BuildCourseDetailsCardForOverviewTap extends StatelessWidget {
  final LearningCentreCubit cubit;
  const BuildCourseDetailsCardForOverviewTap({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey.withAlpha(40)),
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
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.mainBlue,
                size: 20.sp,
              ),
              horizontalSpacing(8),
              Text(
                S.of(context).course_details,
                style: FontHelper.font20BlackW700(context).copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          verticalSpacing(16),
          _buildDetailRow(
            context,
            icon: Icons.event_rounded,
            label: S.of(context).created,
            value: cubit.conurseInfo?.createdAt != null
                ? HelperFunctions.formatDate2(cubit.conurseInfo!.createdAt!)
                : 'Not available',
          ),
          verticalSpacing(12),
          _buildDetailRow(
            context,
            icon: Icons.attach_money_rounded,
            label: S.of(context).price,
            value: cubit.conurseInfo?.price != null
                ? '${cubit.conurseInfo!.price!.toStringAsFixed(2)} ${S.of(context).egp_currency}'
                : S.of(context).free,
          ),
          verticalSpacing(12),
          _buildDetailRow(
            context,
            icon: Icons.check_circle_outline_rounded,
            label: 'Status',
            value: cubit.conurseInfo?.courseStatus ?? 'Active',
            valueColor: AppColors.mainBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.greyBlue,
          size: 18.sp,
        ),
        horizontalSpacing(12),
        Text(
          '$label:',
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
            fontSize: 14.sp,
          ),
        ),
        horizontalSpacing(8),
        Expanded(
          child: Text(
            value,
            style: FontHelper.font15BlackW600(context).copyWith(
              color: valueColor ?? AppColors.darkBlue,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
