import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

PreferredSizeWidget buildModernAppBar(
    {required BuildContext context,
    String? categoryName,
    int? coursesCount,
    bool basicAppBar = false,
    bool showAction = true}) {
  return AppBar(
    elevation: 4,
    // scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    ),
    title: basicAppBar
        ? null
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName ?? "",
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                "$coursesCount ${coursesCount == 1 ? S.of(context).course : S.of(context).courses}",
                style: FontHelper.font12lackW400(context).copyWith(
                  color: Colors.black54,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
    actions: showAction
        ? [
            // Search Action
            Container(
              margin: EdgeInsets.only(right: 8.w),
              child: IconButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Iconsax.search_normal_1,
                    color: Colors.black87,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
            // Filter/Sort Action
            Container(
              margin: EdgeInsets.only(right: 12.w),
              child: IconButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                onPressed: () {
                  _showFilterBottomSheet(context);
                },
                icon: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue.withAlpha(30),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    color: AppColors.mainBlue,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ]
        : null,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: Container(
        height: 1.h,
        decoration: BoxDecoration(color: Colors.black12),
      ),
    ),
  );
}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 50.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          verticalSpacing(24),

          // Title
          Text(
            "Sort & Filter",
            style: FontHelper.font20BlackW700(context).copyWith(
              color: Colors.black87,
              letterSpacing: -0.5,
            ),
          ),
          verticalSpacing(24),

          // Sort Options
          Text(
            "Sort by",
            style: FontHelper.font16BlackW600(context).copyWith(
              color: Colors.black87,
              letterSpacing: -0.5,
            ),
          ),
          verticalSpacing(16),

          _buildSortOption(
              context, "Most Popular", Icons.trending_up_rounded, true),
          _buildSortOption(
              context, "Price: Low to High", Icons.arrow_upward_rounded, false),
          _buildSortOption(context, "Price: High to Low",
              Icons.arrow_downward_rounded, false),
          _buildSortOption(
              context, "Duration", Icons.access_time_rounded, false),
          _buildSortOption(context, "Rating", Icons.star_rounded, false),

          verticalSpacing(32),

          // Apply Button
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                "Apply",
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),

          verticalSpacing(16),
        ],
      ),
    ),
  );
}

Widget _buildSortOption(
    BuildContext context, String title, IconData icon, bool isSelected) {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    child: InkWell(
      onTap: () {
        // Handle sort option selection
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainBlue.withAlpha(20)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.mainBlue : Colors.grey.shade600,
              size: 20.sp,
            ),
            horizontalSpacing(12),
            Text(
              title,
              style: FontHelper.font14BlackW500(context).copyWith(
                color: isSelected ? AppColors.mainBlue : Colors.black87,
                letterSpacing: -0.5,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.mainBlue,
                size: 20.sp,
              ),
          ],
        ),
      ),
    ),
  );
}
