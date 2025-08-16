import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../logic/cubit/search_cubit.dart';

class BuildSearchedCoursesWidget extends StatelessWidget {
  final SearchCubit searchCubit;
  final List<CourseInfoModel> searchedCourses;

  const BuildSearchedCoursesWidget({
    super.key,
    required this.searchCubit,
    required this.searchedCourses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: searchedCourses.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final course = searchedCourses[index];
        return _buildCourseCard(context, course, index);
      },
    );
  }

  Widget _buildCourseCard(
      BuildContext context, CourseInfoModel course, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(30),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.courseDetails,
                arguments: course);
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                // Course Thumbnail
                _buildCourseThumbnail(course),
                horizontalSpacing(16),
                // Course Details
                Expanded(
                  child: _buildCourseDetails(context, course),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseThumbnail(CourseInfoModel course) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue,
            AppColors.secondaryBlue,
          ],
        ),
      ),
      child: course.thumbnail != null && course.thumbnail!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiConstants.baseUrlOfTheImage}${course.thumbnail!}",
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) =>
                    _buildPlaceholderThumbnail(),
              ),
            )
          : _buildPlaceholderThumbnail(),
    );
  }

  Widget _buildPlaceholderThumbnail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.mainBlue,
            AppColors.secondaryBlue,
          ],
        ),
      ),
      child: Icon(
        Icons.play_circle_outline_rounded,
        color: Colors.white,
        size: 32.w,
      ),
    );
  }

  Widget _buildCourseDetails(BuildContext context, CourseInfoModel course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Course Title
        Text(
          course.title ?? 'Course Title',
          style: FontHelper.font16BlackW600(context),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),

        // Instructor Name
        if (course.instructorName != null)
          Text(
            '${S.of(context).by} ${course.instructorName}',
            style: FontHelper.font12lackW400(context).copyWith(
              color: AppColors.greyBlue,
            ),
          ),
        verticalSpacing(8),

        // Course Info Row
        Row(
          children: [
            // Rating
            if (course.rating != null) ...[
              Icon(
                Icons.star_rounded,
                color: Colors.amber,
                size: 16.w,
              ),
              SizedBox(width: 4.w),
              Text(
                course.rating.toString(),
                style: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.darkGreyBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 12.w),
            ],

            // Duration
            if (course.durationInHours != null) ...[
              Icon(
                Icons.access_time_rounded,
                color: AppColors.greyBlue,
                size: 14.w,
              ),
              SizedBox(width: 4.w),
              Text(
                '${course.durationInHours}h',
                style: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.greyBlue,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 8.h),

        // Price and Category
        Row(
          children: [
            // Price
            if (course.price != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: course.price! == 0
                      ? Colors.green.withAlpha(30)
                      : AppColors.mainBlue.withAlpha(30),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  course.price! > 0
                      ? '${course.price!.toStringAsFixed(0)} ${S.of(context).egp_currency}'
                      : 'Free',
                  style: FontHelper.font10BlackW600(context).copyWith(
                      color: course.price! == 0
                          ? Colors.green
                          : AppColors.mainBlue,
                      fontSize: 11.sp),
                ),
              ),
            SizedBox(width: 8.w),

            // Category
            if (course.categoryName != null)
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.grey.withAlpha(60),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    course.categoryName!,
                    style: FontHelper.font10BlackW500(context).copyWith(
                      color: AppColors.darkGreyBlue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
