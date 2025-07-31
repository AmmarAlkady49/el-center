import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/search_cubit.dart';

class BuildCategoriesSuggestionsWidget extends StatelessWidget {
  final SearchCubit searchCubit;

  const BuildCategoriesSuggestionsWidget({
    super.key,
    required this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Grid
        Expanded(
          child: _buildCategoryGrid(context),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    final categories = [
      _CategoryItem(
        categoryCode: 6,
        title: S.of(context).data_science,
        icon: Icons.analytics_outlined,
        color: const Color(0xFF6C5CE7),
        description: S.of(context).learn_data_analysis,
      ),
      _CategoryItem(
        categoryCode: 1,
        title: S.of(context).web_development,
        icon: Icons.web_outlined,
        color: const Color(0xFF00B894),
        description: S.of(context).frontend_and_backend,
      ),
      _CategoryItem(
        categoryCode: 2,
        title: S.of(context).mobile_development,
        icon: Icons.phone_android_outlined,
        color: const Color(0xFFE17055),
        description: S.of(context).iso_android_cross_platform,
      ),
      _CategoryItem(
        categoryCode: 5,
        title: S.of(context).cybersecurity,
        icon: Icons.security_rounded,
        color: const Color(0xFFF39C12),
        description: S.of(context).learn_cybersecurity,
      ),
    ];

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.90,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 150)),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: _buildCategoryCard(
            context,
            categories[index],
            categories[index].categoryCode,
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, _CategoryItem category, int categoryCode) {
    return GestureDetector(
      onTap: () => searchCubit.setSearchQuery(' ', categoryCode),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: category.color.withAlpha(40),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    category.color.withAlpha(15),
                    category.color.withAlpha(30),
                  ],
                ),
                border: Border.all(color: category.color.withAlpha(30)),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: category.color.withAlpha(30),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      category.icon,
                      color: category.color,
                      size: 24.w,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Title
                  Text(
                    category.title,
                    style: FontHelper.font16BlackW600(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8.h),

                  // Description
                  Text(
                    category.description,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: AppColors.greyBlue.withAlpha(200),
                      fontSize: 12.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Hover Effect Indicator
            Positioned(
              top: 16.h,
              right: context.locale.languageCode == 'en' ? 16.w : null,
              left: context.locale.languageCode == 'ar' ? 16.w : null,
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: category.color.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: category.color,
                  size: 12.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final int categoryCode;

  _CategoryItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.categoryCode,
  });
}
