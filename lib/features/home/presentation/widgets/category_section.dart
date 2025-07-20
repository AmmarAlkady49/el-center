import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

import '../../../../core/theming/app_colors.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'icon': Icons.language_outlined,
        'label': 'Web Development',
        'color': AppColors.mainBlue,
        'categoryId': 1,
      },
      {
        'icon': Icons.smartphone_outlined,
        'label': 'Mobile App Development',
        'color': AppColors.secondaryBlue,
        'categoryId': 2,
      },
      {
        'icon': Icons.psychology_outlined,
        'label': 'AI & Machine Learning',
        'color': AppColors.darkBlue,
        'categoryId': 3,
      },
      {
        'icon': Icons.apps_outlined,
        'label': 'All categories',
        'color': AppColors.greyBlue,
        'categoryId': 0,
      },
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).browse_by_category,
            style:
                FontHelper.font20BlackW700(context).copyWith(fontSize: 18.sp),
          ),
          verticalSpacing(12),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 67.h,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.coursesByCategory,
                  arguments: categories[index]['categoryId'],
                );
              },
              child: _buildCategoryItem(
                context: context,
                icon: categories[index]['icon'] as IconData,
                label: categories[index]['label'] as String,
                color: categories[index]['color'] as Color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required String label,
    required Color color,
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: FontHelper.font15BlackW600(context).copyWith(
                color: color,
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
