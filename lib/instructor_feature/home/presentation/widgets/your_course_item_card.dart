import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/course_info_model_with_student_count_and_completion_rate_model.dart';

class YourCourseItemCard extends StatelessWidget {
  final CourseInfoModelWithStudentCountAndCompletionRateModel course;
  final VoidCallback? onTap;
  final VoidCallback? onEditTap;
  final HomeInstructorCubit cubit;

  const YourCourseItemCard({
    super.key,
    required this.course,
    this.onTap,
    this.onEditTap,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(10),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(
          color: AppColors.grey.withAlpha(40),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                verticalSpacing(20),
                _buildStatsRow(context),
                verticalSpacing(20),
                _buildProgressSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        _buildCourseImage(),
        horizontalSpacing(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.courseInfoModel.title ?? 'Course Title',
                style: FontHelper.font16WhiteW600(context).copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                  letterSpacing: -0.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpacing(8),
              // Removed duplicate student count badge - keeping only the one in stats row
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.withAlpha(305),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: CachedNetworkImage(
          imageUrl:
              "${ApiConstants.baseUrlOfTheImage}/${course.courseInfoModel.thumbnail}",
          width: 65.w,
          height: 65.w,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildImagePlaceholder(),
          errorWidget: (context, url, error) =>
              _buildImagePlaceholder(isError: true),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder({bool isError = false}) {
    return Container(
      width: 65.w,
      height: 65.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue.withAlpha(90),
            AppColors.mainBlue.withAlpha(175),
          ],
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isError ? Iconsax.warning_2 : Iconsax.play_circle,
            color: Colors.white,
            size: 24.sp,
          ),
          if (isError) ...[
            verticalSpacing(4),
            Text(
              'Failed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildStatChip(
            context,
            Iconsax.people,
            '${course.studentCount}',
            S.of(context).students,
            AppColors.mainBlue,
          ),
          horizontalSpacing(12),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildStatChip(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: color.withAlpha(60),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: color,
          ),
          horizontalSpacing(6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: color,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              Text(
                label,
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.editCourse,
            arguments: {
              'course': course.courseInfoModel,
              'cubit': cubit,
            },
          );
        },
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.mainBlue,
                AppColors.mainBlue.withAlpha(220),
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainBlue.withAlpha(100),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Iconsax.edit_2,
                size: 16.sp,
                color: Colors.white,
              ),
              horizontalSpacing(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).edit_course,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    S.of(context).modify,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: Colors.white.withAlpha(220),
                      fontSize: 10.sp,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    final completionPercentage =
        (course.completionRate * 100).clamp(0, 100).toInt();
    final isCompleted = completionPercentage >= 100;
    final isHighProgress = completionPercentage >= 75;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).completion,
                  style: FontHelper.font14BlackW500(context).copyWith(
                    color: AppColors.greyBlue,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                horizontalSpacing(6),
                if (isCompleted)
                  Icon(
                    Iconsax.medal_star,
                    size: 16.sp,
                    color: Colors.amber,
                  ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green.withAlpha(30)
                    : isHighProgress
                        ? AppColors.mainBlue.withAlpha(30)
                        : AppColors.grey.withAlpha(30),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: isCompleted
                      ? Colors.green.withAlpha(90)
                      : isHighProgress
                          ? AppColors.mainBlue.withAlpha(90)
                          : AppColors.grey.withAlpha(90),
                  width: 0.5,
                ),
              ),
              child: Text(
                '$completionPercentage%',
                style: FontHelper.font14BlackW500(context).copyWith(
                  color: isCompleted
                      ? Colors.green
                      : isHighProgress
                          ? AppColors.mainBlue
                          : AppColors.greyBlue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        verticalSpacing(12),
        Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: AppColors.grey.withAlpha(305),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withAlpha(305),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (course.completionRate).clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: isCompleted
                          ? [Colors.green, Colors.green.shade400]
                          : isHighProgress
                              ? [
                                  AppColors.mainBlue,
                                  AppColors.mainBlue.withAlpha(200)
                                ]
                              : [
                                  AppColors.mainBlue.withAlpha(175),
                                  AppColors.mainBlue.withAlpha(150)
                                ],
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                    boxShadow: [
                      BoxShadow(
                        color: (isCompleted ? Colors.green : AppColors.mainBlue)
                            .withAlpha(90),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (completionPercentage < 100) ...[
          verticalSpacing(8),
          Text(
            '${S.of(context).keep_going_you_are} ${100 - completionPercentage}% ${S.of(context).away_from_completion}.',
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue.withAlpha(200),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}
