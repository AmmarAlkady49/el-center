import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildCourseDetailsHeader extends StatelessWidget {
  final CourseInfoModel courseBasicInfo;
  const BuildCourseDetailsHeader({super.key, required this.courseBasicInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          courseBasicInfo.title ?? 'Product Title',
          style: FontHelper.font24BlackW700(context).copyWith(
            color: AppColors.darkGreyBlue,
            height: 1.2,
            letterSpacing: 0.5,
          ),
        ),
        verticalSpacing(8),

        // Category
        if (courseBasicInfo.categoryName != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.grey.withAlpha(150),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              courseBasicInfo.categoryName!,
              style: FontHelper.font12lackW400(context).copyWith(
                color: AppColors.greyBlue,
                letterSpacing: -0.2,
              ),
            ),
          ),

        verticalSpacing(16),

        // Rating and duration
        Row(
          children: [
            if (courseBasicInfo.rating != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${courseBasicInfo.rating}/5',
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 14.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ],
            if (courseBasicInfo.rating != null &&
                courseBasicInfo.durationInHours != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                width: 1,
                height: 16,
                color: AppColors.grey,
              ),
            if (courseBasicInfo.durationInHours != null)
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: AppColors.greyBlue,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${courseBasicInfo.durationInHours}h',
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 14.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
          ],
        ),

        // Instructor info
        if (courseBasicInfo.instructorName != null) ...[
          verticalSpacing(16),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.mainBlue.withAlpha(175),
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiConstants.apiBaseUrl}${courseBasicInfo.instructorImage}",
                    width: 35.w,
                    height: 35.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 35.w,
                      height: 35.h,
                      color: Colors.grey.shade200,
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 35.w,
                      height: 35.h,
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.person,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).instructor,
                    style: FontHelper.font12lackW400(context).copyWith(
                      color: AppColors.greyBlue,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Text(
                    courseBasicInfo.instructorName ?? 'Instructor Name',
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 14.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
