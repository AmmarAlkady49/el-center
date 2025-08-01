import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_header_card_of_overview_tap.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_progress_card_for_overview_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../logic/cubit/learning_centre_cubit.dart';
import 'build_course_details_card_for_overview_tap.dart';
import 'build_course_stats_for_overview_tap.dart';
import 'build_instructor_card_for_overview_tap.dart';

class BuildOverviewTapBarView extends StatelessWidget {
  const BuildOverviewTapBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LearningCentreCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Header Card
            BuildHeaderCardOfOverviewTap(cubit: cubit),
            verticalSpacing(20.h),

            // Course Stats Row
            BuildCourseStatsForOverviewTap(cubit: cubit),
            verticalSpacing(20.h),

            // Instructor Card
            BuildInstructorCardForOverviewTap(cubit: cubit),
            verticalSpacing(20.h),

            // Course Description Card
            _buildDescriptionCard(context, cubit),
            verticalSpacing(20.h),

            // Progress Card
            BuildProgressCardForOverviewTap(cubit: cubit),
            verticalSpacing(20.h),

            // Course Details Card
            BuildCourseDetailsCardForOverviewTap(cubit: cubit),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionCard(
      BuildContext context, LearningCentreCubit cubit) {
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
            children: [
              Icon(
                Icons.description_rounded,
                color: AppColors.mainBlue,
                size: 20.sp,
              ),
              horizontalSpacing(8.w),
              Text(
                S.of(context).course_description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: FontHelper.font20BlackW700(context).copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          verticalSpacing(12.h),
          HtmlWidget(
            cubit.conurseInfo?.description ?? 'No description available',
            textStyle: FontHelper.font14BlackW500(context).copyWith(
              height: 1.5,
              color: AppColors.greyBlue,
            ),
          ),
        ],
      ),
    );
  }
}
