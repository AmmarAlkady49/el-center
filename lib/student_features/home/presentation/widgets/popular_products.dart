import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/modern_app_button.dart';

class PopularProducts extends StatelessWidget {
  final List<CourseInfoModel> courses;
  const PopularProducts({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context),
        verticalSpacing(4),
        SizedBox(
          height: 310.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return _buildModernCourseCard(
                courseInfo: courses[index],
                title: courses[index].title!,
                category: courses[index].categoryName!,
                price: courses[index].price!.toString(),
                courseHours: courses[index].durationInHours!.toString(),
                instructorName: courses[index].instructorName!,
                rating: double.parse(courses[index].rating!.toString()),
                imageAsset:
                    "${ApiConstants.baseUrlOfTheImage}${courses[index].thumbnail!}",
                context: context,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).popular_courses,
            style:
                FontHelper.font20BlackW700(context).copyWith(fontSize: 18.sp),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, AppRoutes.coursesByCategory,
                arguments: 0),
            child: Text(
              S.of(context).view_all,
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.mainBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernCourseCard({
    required String title,
    required String category,
    required String price,
    required double rating,
    required String imageAsset,
    required BuildContext context,
    required String instructorName,
    required String courseHours,
    required CourseInfoModel courseInfo,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 10, 0, 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetails,
            arguments: courseInfo),
        child: Container(
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image with Overlay
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageAsset,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => Container(
                          color: Colors.grey.shade200,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.mainBlue,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey.shade200,
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey.shade400,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    // Category Badge
                    Positioned(
                      top: 12.h,
                      left: 12.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(175),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          category,
                          style: FontHelper.font12lackW400(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ),
                    // Rating Badge
                    Positioned(
                      top: 12.h,
                      right: 12.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade600,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              rating == 0.0
                                  ? "Not Rated"
                                  : rating.toStringAsFixed(1),
                              style:
                                  FontHelper.font12lackW400(context).copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Course Details
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, top: 6.h, bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Course Title
                      Text(
                        title,
                        style: FontHelper.font16BlackW600(context).copyWith(
                          color: Colors.black87,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black12,
                            ),
                          ],
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpacing(8),
                      // Course Meta Info
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            color: Colors.grey.shade500,
                            size: 16,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "${courseHours}h",
                            style: FontHelper.font12lackW400(context).copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Icon(
                            Icons.person_outline,
                            color: Colors.grey.shade500,
                            size: 16,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              instructorName,
                              style:
                                  FontHelper.font12lackW400(context).copyWith(
                                color: Colors.grey.shade600,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Price and Enroll Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price == "0.0" ? "Free" : "$price EGP",
                            style: FontHelper.font20BlackW700(context).copyWith(
                              color: price == "0.0"
                                  ? Colors.green.withAlpha(255)
                                  : Colors.black.withAlpha(200),
                              fontSize: 18.sp,
                              //fontWeight: FontWeight.w800,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.mainBlue,
                                  AppColors.mainBlue.withAlpha(200),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.mainBlue.withAlpha(30),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: 100.w,
                              height: 44.h,
                              child: ModernAppButton(
                                text: S.of(context).view_course,
                                isLoading: false,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.courseDetails,
                                    arguments: courseInfo,
                                  );
                                },
                                backgroundColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(16.r),
                                horizontalPadding: 0,
                                verticalPadding: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
