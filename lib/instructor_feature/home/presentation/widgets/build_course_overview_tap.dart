import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/instructor_feature/home/presentation/widgets/your_course_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/profile_account_model.dart';
import '../../logic/cubit/home_instructor_cubit.dart';
import '../../logic/cubit/home_instructor_state.dart';

class BuildCourseOverviewTap extends StatelessWidget {
  final ProfileAccountModel instructorProfile;
  final HomeIstructorSuccess state;
  final HomeInstructorCubit cubit;
  const BuildCourseOverviewTap(
      {super.key,
      required this.instructorProfile,
      required this.state,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsCards(context),
          verticalSpacing(24),
          _buildQuickActions(context),
          verticalSpacing(24),
          _buildRecentCourses(context),
        ],
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_teaching_overView,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: Colors.grey[800],
            fontSize: 19.sp,
          ),
        ),
        verticalSpacing(8),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                S.of(context).total_courses,
                state.totalCourses.toString(),
                Icons.book_outlined,
                Colors.blue,
                context,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                S.of(context).total_students,
                state.totalStudents.toString(),
                Icons.people_outline,
                Colors.green,
                context,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                S.of(context).avg_completion_rate,
                "${(state.avgCompletionRate * 100).toStringAsFixed(2)}%",
                Icons.attach_money_rounded,
                Colors.orange,
                context,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                S.of(context).ratings,
                '${state.avgRating.toStringAsFixed(1)}★',
                Icons.star_outline,
                Colors.purple,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withAlpha(30),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: color,
            ),
          ),
          verticalSpacing(12),
          Text(
            value,
            style: FontHelper.font16BlackW600(context).copyWith(
              color: Colors.grey[800],
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: Colors.grey[600],
              fontSize: 13.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).quick_actions,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: Colors.grey[800],
            fontSize: 19.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                S.of(context).create_course,
                Icons.add_circle_outline,
                Colors.blue,
                () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.createNewCourse,
                    arguments: cubit,
                  );
                },
                context,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildActionButton(
                S.of(context).view_analytics,
                Icons.analytics_outlined,
                Colors.green,
                () {},
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color,
      VoidCallback onTap, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withAlpha(30),
                color.withAlpha(15),
              ],
            ),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: color.withAlpha(60)),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 32.sp,
                color: color,
              ),
              verticalSpacing(8),
              Text(
                title,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: color,
                  fontSize: 13.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentCourses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).your_courses,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: Colors.grey[800],
                fontSize: 19.sp,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.yourCoursesPage,
                    arguments: {
                      'state': state
                          .courseInfoModelWithStudentCountAndCompletionRateModel,
                      'cubit': cubit,
                    });
              },
              child: Text(
                S.of(context).view_all,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: Colors.blue,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
        verticalSpacing(8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.totalCourses,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final course = state
                .courseInfoModelWithStudentCountAndCompletionRateModel[index];
            return YourCourseItemCard(
              course: course,
              cubit: cubit,
            );
          },
        ),
      ],
    );
  }
}
