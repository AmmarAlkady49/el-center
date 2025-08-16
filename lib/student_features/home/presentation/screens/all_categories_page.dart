import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/student_features/home/logic/cubit/home_cubit.dart';
import 'package:e_learning_app/student_features/home/logic/cubit/home_state.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/helpers/build_app_bar.dart';
import '../../../../core/routing/app_routes.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({super.key});

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (previous, current) =>
          current is GettingCategories ||
          current is CategoriesLoaded ||
          current is CategoriesLoadedError,
      builder: (context, state) {
        if (state is GettingCategories) {
          return Scaffold(
              backgroundColor: Colors.grey.shade50,
              appBar: buildModernAppBar(
                context: context,
                categoryName: S.of(context).all_categories,
                basicAppBar: true,
                showAction: false,
              ),
              body: _buildLoadingState());
        } else if (state is CategoriesLoadedError) {
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: buildModernAppBar(
              context: context,
              categoryName: S.of(context).all_categories,
              basicAppBar: true,
              showAction: false,
            ),
            body: _buildErrorState(state.error),
          );
        } else if (state is CategoriesLoaded) {
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            appBar: buildModernAppBar(
              context: context,
              categoryName: S.of(context).all_categories,
              coursesCount: state.categories.length,
              showAction: false,
            ),
            body: _buildCategoriesGrid(state.categories),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(),
          verticalSpacing(16),
          Text(
            '${S.of(context).loading} ${S.of(context).categories}...',
            style: FontHelper.font16BlackW500(context).copyWith(
              color: AppColors.greyBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
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
              style: FontHelper.font16WhiteW600(context)
                  .copyWith(fontSize: 18.sp, color: AppColors.darkBlue),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(8),
            Text(
              error,
              style: FontHelper.font12lackW400(context)
                  .copyWith(color: AppColors.greyBlue, fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(24),
            ElevatedButton(
              onPressed: () => context.read<HomeCubit>().getAllCategories(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainBlue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                S.of(context).tryAgain,
                style: FontHelper.font16BlackW600(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(List<CategoryModel> categories) {
    final categoryItems = categories
        .map((category) => _CategoryItem(
              categoryCode: category.id,
              title: category.name,
              icon: _getIconForCategory(category.name),
              color: _getColorForCategory(category.name),
              description: _getDescriptionForCategory(category.name),
            ))
        .toList();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${S.of(context).explore} ${categories.length} ${S.of(context).categories}:',
              style: FontHelper.font20BlackW700(context).copyWith(
                color: AppColors.darkBlue,
                fontSize: 18.sp,
              ),
            ),
            verticalSpacing(20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: categoryItems.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.90,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
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
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.coursesByCategory,
                        arguments: categoryItems[index].categoryCode),
                    child: _buildCategoryItem(
                      context,
                      categoryItems[index],
                      categoryItems[index].categoryCode,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, _CategoryItem category, int categoryCode) {
    return Container(
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
    );
  }

  IconData _getIconForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'web development':
        return Icons.language_outlined;
      case 'mobile app development':
        return Icons.smartphone_outlined;
      case 'ai & machine learning':
        return Icons.psychology_outlined;
      case 'game development':
        return Icons.sports_esports_outlined;
      case 'cybersecurity':
        return Icons.security_outlined;
      case 'data science':
        return Icons.analytics_outlined;
      default:
        return Icons.book_outlined;
    }
  }

  Color _getColorForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'web development':
        return const Color(0xFF00B894);
      case 'mobile app development':
        return const Color(0xFFE17055);
      case 'ai & machine learning':
        return const Color(0xFF6C5CE7);
      case 'game development':
        return const Color(0xFFE84393);
      case 'cybersecurity':
        return const Color(0xFFF39C12);
      case 'data science':
        return const Color(0xFF00B894);
      default:
        return AppColors.mainBlue;
    }
  }

  String _getDescriptionForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'web development':
        return S.of(context).frontend_and_backend;
      case 'mobile app development':
        return S.of(context).iso_android_cross_platform;
      case 'ai & machine learning':
        return S.of(context).learn_data_analysis;
      case 'game development':
        return S.of(context).iso_android_cross_platform;
      case 'cybersecurity':
        return S.of(context).learn_cybersecurity;
      case 'data science':
        return S.of(context).learn_data_analysis;
      default:
        return S.of(context).learn_data_analysis;
    }
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
