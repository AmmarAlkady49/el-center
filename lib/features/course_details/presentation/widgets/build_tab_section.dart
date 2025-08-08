import 'package:e_learning_app/core/data/models/course_review_model.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_course_reviews.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_curriclum_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iconsax/iconsax.dart';

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
          margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: AppColors.grey.withAlpha(60),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.all(6.w),
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainBlue,
                    AppColors.mainBlue.withAlpha(200),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainBlue.withAlpha(100),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.greyBlue,
              labelStyle: FontHelper.font15BlackW600(context).copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: FontHelper.font12lackW400(context).copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              tabs: [
                _buildModernTab(context, Iconsax.book_1,
                    S.of(context).curriculum, 0, _tabController),
                _buildModernTab(context, Iconsax.chart_21,
                    S.of(context).overView, 1, _tabController),
                _buildModernTab(context, Iconsax.star_1, S.of(context).reviews,
                    2, _tabController),
              ],
            ),
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
                cubit: widget.cubit,
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

  Widget _buildModernTab(BuildContext context, IconData icon, String text,
      int index, TabController tabController) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        final isSelected = tabController.index == index;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  icon,
                  size: isSelected ? 20.sp : 18.sp,
                  color: isSelected ? Colors.white : AppColors.greyBlue,
                ),
              ),
              horizontalSpacing(8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: isSelected
                    ? FontHelper.font15BlackW600(context).copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )
                    : FontHelper.font12lackW400(context).copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyBlue,
                      ),
                child: Text(text),
              ),
            ],
          ),
        );
      },
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
        HtmlWidget(
          courseBasicInfo.description ?? 'No description available.',
          textStyle: FontHelper.font14BlackW500(context).copyWith(
            height: 1.5,
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
