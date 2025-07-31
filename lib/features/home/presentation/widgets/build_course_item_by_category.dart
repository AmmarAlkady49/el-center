import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class BuildCourseItemByCategory extends StatelessWidget {
  final CourseInfoModel courseItem;
  const BuildCourseItemByCategory({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Material(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () {
              context.pushNamed(AppRoutes.courseDetails, arguments: courseItem);
            },
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Thumbnail with gradient overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.apiBaseUrl}${courseItem.thumbnail}",
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.grey.shade200,
                            ),
                            child: const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.grey.shade200,
                            ),
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                      // total hours badge
                      Positioned(
                        top: 4.h,
                        right: 4,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(170),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                          ),
                          child: Text(
                            "${courseItem.durationInHours}h",
                            textAlign: TextAlign.center,
                            style: FontHelper.font10BlackW600(context).copyWith(
                              color: Colors.white,
                              letterSpacing: -0.4,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      // category badge
                      Positioned(
                        bottom: 0.h,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(170),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.r),
                                bottomRight: Radius.circular(12.r)),
                          ),
                          child: Text(
                            courseItem.categoryName ?? S.of(context).course,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FontHelper.font10BlackW600(context).copyWith(
                              color: Colors.white,
                              letterSpacing: -0.4,
                              fontSize: 10.sp,
                            ),
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
                          courseItem.title ?? "Course Title",
                          style: FontHelper.font15BlackW600(context).copyWith(
                            height: 1.2,
                            letterSpacing: -0.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        verticalSpacing(8),

                        // Instructor Info
                        Row(
                          children: [
                            HelperFunctions.getInstructorImage(
                                courseItem.instructorImage, 35.r),
                            horizontalSpacing(8),
                            Expanded(
                              child: Text(
                                courseItem.instructorName ?? "Instructor Name",
                                style:
                                    FontHelper.font12lackW400(context).copyWith(
                                  color: Colors.grey.shade600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        verticalSpacing(12),

                        // Price and Button Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Price with styling
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).price,
                                  style: FontHelper.font10BlackW500(context)
                                      .copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  "${courseItem.price} ${S.of(context).egp_currency}",
                                  style: FontHelper.font15BlackW600(context)
                                      .copyWith(
                                    color: AppColors.mainBlue,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),

                            // Enhanced Join Button
                            SizedBox(
                              height: 36.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle join action
                                  context.pushNamed(AppRoutes.courseDetails,
                                      arguments: courseItem);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainBlue,
                                  foregroundColor: Colors.white,
                                  elevation: 1,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  S.of(context).more_details,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontHelper.font10BlackW500(context)
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
