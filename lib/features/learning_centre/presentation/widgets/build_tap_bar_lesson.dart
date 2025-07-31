import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_course_content_tap_bar_view.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_quizzes_tap_bar_view.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_ai_assistant_tap_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import 'build_overview_tap_bar_view.dart';
import 'build_q_and_a_tap_bar_view.dart';

class BuildTapBarLesson extends StatefulWidget {
  final LearningCentreCubit cubit;
  const BuildTapBarLesson({super.key, required this.cubit});

  @override
  State<BuildTapBarLesson> createState() => _BuildTapBarLessonState();
}

class _BuildTapBarLessonState extends State<BuildTapBarLesson>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
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
              controller: tabController,
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
                _buildModernTab(
                  context,
                  Iconsax.book_1,
                  S.of(context).course_content,
                  0,
                ),
                _buildModernTab(
                  context,
                  Iconsax.chart_21,
                  S.of(context).overView,
                  1,
                ),
                _buildModernTab(
                  context,
                  Iconsax.cpu_charge,
                  S.of(context).ai_assistant,
                  2,
                ),
                _buildModernTab(
                  context,
                  Iconsax.clipboard_tick,
                  S.of(context).quizzes,
                  3,
                ),
                _buildModernTab(
                  context,
                  Iconsax.message_question,
                  S.of(context).q_and_a,
                  4,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              BuildCourseContentTapBarView(cubit: widget.cubit),
              BuildOverviewTapBarView(),
              BuildAiAssistant(courseReviews: widget.cubit.courseReview!),
              BuildQuizzesTapBarView(),
              BuildQAndATapBarView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModernTab(
      BuildContext context, IconData icon, String text, int index) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        final isSelected = tabController.index == index;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
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
