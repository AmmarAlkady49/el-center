import 'package:e_learning_app/core/data/models/course_review_model.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_course_reviews.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_curriclum_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/course_module_model.dart';
import '../../../../core/data/models/course_modules_with_lessons.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildTabSection extends StatefulWidget {
  final CourseInfoModel courseBasicInfo;
  final List<CourseModuleModel> courseModules;
  final List<CourseModulesWithLessons> modulesWithLessons;
  final List<CourseReviewModel> courseReviews;
  final bool isEnrolled;
  final CourseDetailsCubit cubit;
  const BuildTabSection({
    super.key,
    required this.courseBasicInfo,
    required this.courseModules,
    required this.modulesWithLessons,
    required this.courseReviews,
    required this.isEnrolled,
    required this.cubit,
  });

  @override
  State<BuildTabSection> createState() => _BuildTabSectionState();
}

class _BuildTabSectionState extends State<BuildTabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey.withAlpha(150),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: TabBar(
            controller: _tabController,
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
            indicator: BoxDecoration(
              color: AppColors.backgroundWiteColor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border(
                  bottom: BorderSide(color: AppColors.mainBlue, width: 2.h)),
            ),
            labelColor: AppColors.darkGreyBlue,
            unselectedLabelColor: AppColors.greyBlue,
            automaticIndicatorColorAdjustment: true,
            dividerHeight: 0,
            labelStyle: FontHelper.font15BlackW600(context).copyWith(
              letterSpacing: -0.5,
              fontSize: 14.sp,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
            unselectedLabelStyle: FontHelper.font12lackW400(context).copyWith(
              letterSpacing: -0.5,
              fontSize: 14.sp,
            ),
            indicatorColor: AppColors.mainBlue,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: S.of(context).curriculum),
              Tab(text: S.of(context).overView),
              Tab(text: S.of(context).reviews),
            ],
          ),
        ),
        verticalSpacing(16),
        SizedBox(
          height: 400.h,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BuildCurriculumTab(
                courseModules: widget.courseModules,
                modulesWithLessons: widget.modulesWithLessons,
              ),
              _buildOverViewTab(context, widget.courseBasicInfo),
              BuildCourseReviews(
                courseReview: widget.courseReviews,
                isEnrolled: widget.isEnrolled,
                courseBasicInfo: widget.courseBasicInfo,
                cubit: widget.cubit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildOverViewTab(BuildContext context, final courseBasicInfo) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).about_this_course,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        verticalSpacing(8),
        Text(
          courseBasicInfo.description ?? 'No description available.',
          style: FontHelper.font14BlackW500(context).copyWith(
            height: 1.6,
            color: AppColors.greyBlue,
          ),
        ),
        verticalSpacing(18),
        Text(
          S.of(context).requirements,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        verticalSpacing(8),
        Text(
          courseBasicInfo.requirements == null
              ? "- No requirements available"
              : "- ${courseBasicInfo.requirements}",
          style: FontHelper.font14BlackW500(context).copyWith(
            height: 1.6,
            color: AppColors.greyBlue,
          ),
        ),
      ],
    ),
  );
}
