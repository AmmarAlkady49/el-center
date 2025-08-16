import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/core/widgets/build_geniric_app_bar.dart';
import 'package:e_learning_app/student_features/my_courses/logic/cubit/my_courses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/helper_functions.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/student_enrollments_model.dart';
import '../../logic/cubit/my_courses_state.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MyCoursesCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundWiteColor,
      appBar: buildGenericAppBar(
        context,
        title: S.of(context).my_courses,
        elevation: 0,
        hasIconLeading: false,
      ),
      body: BlocBuilder<MyCoursesCubit, MyCoursesState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
            current is MyCoursesLoaded ||
            current is MyCoursesLoading ||
            current is MyCoursesLoadedError,
        builder: (context, state) {
          if (state is MyCoursesLoadedError) {
            return _buildErrorState(context, state.errorMessage);
          }
          if (state is MyCoursesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is MyCoursesLoaded) {
            if (state.studentEnrollments.isEmpty) {
              return _buildEmptyState(context);
            }
            return _buildLoadedState(context, state);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64.sp,
            color: Colors.red.shade400,
          ),
          verticalSpacing(16),
          Text(
            S.of(context).something_went_wrong,
            style: FontHelper.font15BlackW600(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: FontHelper.font12lackW400(context)
                .copyWith(color: Colors.grey.shade600, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 80.sp,
            color: Colors.grey.shade400,
          ),
          verticalSpacing(16),
          Text(
            S.of(context).no_enrolled_courses,
            style: FontHelper.font15BlackW600(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            S.of(context).start_learning_today,
            textAlign: TextAlign.center,
            style: FontHelper.font12lackW400(context).copyWith(
              color: Colors.grey.shade600,
              fontSize: 14.sp,
            ),
          ),
          verticalSpacing(24),
          ElevatedButton(
            onPressed: () {
              // Navigate to courses page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBlue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              S.of(context).browse_courses,
              style: FontHelper.font12lackW400(context)
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, MyCoursesLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue.withAlpha(40),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      color: AppColors.mainBlue,
                      size: 24.sp,
                    ),
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).my_learning_journey,
                          style: FontHelper.font20BlackW700(context).copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        verticalSpacing(4),
                        Text(
                          "${state.studentEnrollments.length} ${S.of(context).enrolled_courses}",
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: AppColors.greyBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          verticalSpacing(16),

          // Progress Overview
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: _buildProgressOverview(context, state),
          ),

          verticalSpacing(24),

          // Courses List
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              S.of(context).your_courses,
              style: FontHelper.font20BlackW700(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 18.sp,
              ),
            ),
          ),

          verticalSpacing(12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: state.studentEnrollments.length,
            separatorBuilder: (context, index) => verticalSpacing(12),
            itemBuilder: (context, index) {
              final course = state.studentEnrollments[index];
              final enrollment = state.studentEnrollmentsCoursesInfo
                  .firstWhere((e) => e.courseId == course.id);

              return _buildEnhancedCourseCard(context, course, enrollment);
            },
          ),

          verticalSpacing(24),
        ],
      ),
    );
  }

  Widget _buildProgressOverview(BuildContext context, MyCoursesLoaded state) {
    final completedCourses = state.studentEnrollmentsCoursesInfo
        .where((e) => e.progress >= 100)
        .length;
    final inProgressCourses = state.studentEnrollmentsCoursesInfo
        .where((e) => e.progress > 0 && e.progress < 100)
        .length;
    final totalCourses = state.studentEnrollments.length;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.mainBlue.withAlpha(190),
            AppColors.mainBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(90),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              context,
              S.of(context).completed,
              completedCourses.toString(),
              Icons.verified_rounded,
              Colors.white,
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: Colors.white.withAlpha(90),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              S.of(context).in_progress,
              inProgressCourses.toString(),
              Icons.play_circle_rounded,
              Colors.white,
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: Colors.white.withAlpha(90),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              S.of(context).total,
              totalCourses.toString(),
              Icons.library_books_rounded,
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value,
      IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24.sp),
        verticalSpacing(8),
        Text(
          value,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: color,
          ),
        ),
        verticalSpacing(4),
        Text(
          label,
          style: FontHelper.font14BlackW500(context).copyWith(
            color: color.withAlpha(200),
            fontSize: 12.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEnhancedCourseCard(
    BuildContext context,
    CourseInfoModel course,
    StudentEnrollmentsModel enrollment,
  ) {
    final progressPercentage = enrollment.progress.clamp(0.0, 100.0);
    final isCompleted = progressPercentage >= 100;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            context.pushNamed(AppRoutes.courseDetails, arguments: course);
          },
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Thumbnail
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiConstants.apiBaseUrl}${course.thumbnail}",
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.grey.shade200,
                              ),
                              child: const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.grey.shade200,
                              ),
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey.shade400,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ),
                        if (isCompleted)
                          Positioned(
                            top: 4.h,
                            right: 4.w,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: AppColors.mainBlue,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.mainBlue.withAlpha(90),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12.sp,
                              ),
                            ),
                          ),
                      ],
                    ),

                    horizontalSpacing(16),

                    // Course Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Course Title
                          Text(
                            course.title ?? "Course Title",
                            style: FontHelper.font16BlackW600(context).copyWith(
                              height: 1.3,
                              color: AppColors.darkBlue,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          verticalSpacing(6),

                          // Instructor
                          Row(
                            children: [
                              HelperFunctions.getInstructorImage(
                                course.instructorImage,
                                28.w,
                              ),
                              horizontalSpacing(4),
                              Expanded(
                                child: Text(
                                  course.instructorName ?? "Instructor",
                                  style: FontHelper.font12lackW400(context)
                                      .copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 13.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          verticalSpacing(16),

                          // Status Badge
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(enrollment.status)
                                  .withAlpha(30),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: _getStatusColor(enrollment.status),
                                  width: 1.2.r),
                            ),
                            child: Text(
                              _getStatusText(context, enrollment.status),
                              style:
                                  FontHelper.font10BlackW600(context).copyWith(
                                color: _getStatusColor(enrollment.status),
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                verticalSpacing(4),

                // Progress Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).progress,
                          style: FontHelper.font14BlackW500(context).copyWith(
                              color: Colors.grey.shade600, fontSize: 12.sp),
                        ),
                        Text(
                          "${progressPercentage.toInt()}%",
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color: AppColors.mainBlue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: LinearProgressIndicator(
                        value: progressPercentage / 100,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isCompleted
                              ? AppColors.mainBlue
                              : AppColors.mainBlue.withAlpha(175),
                        ),
                        minHeight: 6.h,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),

                verticalSpacing(16),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.courseDetails,
                          arguments: course);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isCompleted
                              ? Icons.replay_rounded
                              : Icons.play_arrow_rounded,
                          size: 18.sp,
                        ),
                        horizontalSpacing(8),
                        Text(
                          isCompleted
                              ? S.of(context).review_course
                              : S.of(context).continue_learning,
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'active':
        return AppColors.mainBlue;
      case 'enrolled':
        return Colors.orange;
      case 'in_progress':
        return AppColors.mainBlue;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return S.of(context).completed;
      case 'active':
        return S.of(context).active;
      case 'enrolled':
        return S.of(context).enrolled;
      case 'in_progress':
        return S.of(context).in_progress;
      default:
        return status;
    }
  }
}
