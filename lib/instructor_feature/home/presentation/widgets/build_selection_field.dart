import 'package:e_learning_app/instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_instructor_state.dart';

class BuildSelectionField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final HomeInstructorCubit cubit;
  const BuildSelectionField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.cubit,
  });

  @override
  State<BuildSelectionField> createState() => _BuildSelectionFieldState();
}

class _BuildSelectionFieldState extends State<BuildSelectionField> {
  @override
  void dispose() {
    widget.cubit.selectedCategory = null;
    widget.cubit.selectedLanguage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
      bloc: widget.cubit,
      buildWhen: (previous, current) =>
          current is SelectCategory || current is SelectLanguage,
      builder: (context, state) {
        final selectedValue = widget.label == S.of(context).category
            ? widget.cubit.selectedCategory
            : widget.cubit.selectedLanguage;
        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: (selectedValue != null ||
                      (state is SelectLanguage &&
                          widget.label == S.of(context).language) ||
                      (state is SelectCategory &&
                          widget.label == S.of(context).category))
                  ? AppColors.mainBlue.withAlpha(100)
                  : AppColors.grey.withAlpha(60),
              width: (selectedValue != null ||
                      (state is SelectLanguage &&
                          widget.label == S.of(context).language) ||
                      (state is SelectCategory &&
                          widget.label == S.of(context).category))
                  ? 1.5
                  : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainBlue.withAlpha(30),
                            AppColors.mainBlue.withAlpha(20),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        widget.icon,
                        color: AppColors.mainBlue,
                        size: 16.sp,
                      ),
                    ),
                    horizontalSpacing(10),
                    Text(
                      widget.label,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: GestureDetector(
                  onTap: () => widget.label == S.of(context).category
                      ? showCategoryBottomSheet(
                          context, widget.cubit.categories)
                      : _showLanguageBottomSheet(context),
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      gradient: (selectedValue != null ||
                              (state is SelectLanguage &&
                                  widget.label == S.of(context).language) ||
                              (state is SelectCategory &&
                                  widget.label == S.of(context).category))
                          ? LinearGradient(
                              colors: [
                                AppColors.mainBlue.withAlpha(30),
                                AppColors.mainBlue.withAlpha(20),
                              ],
                            )
                          : null,
                      color: (selectedValue != null ||
                              (state is SelectLanguage &&
                                  widget.label == S.of(context).language) ||
                              (state is SelectCategory &&
                                  widget.label == S.of(context).category))
                          ? AppColors.grey.withAlpha(50)
                          : null,
                      border: Border.all(
                        color: (selectedValue != null ||
                                (state is SelectLanguage &&
                                    widget.label == S.of(context).language) ||
                                (state is SelectCategory &&
                                    widget.label == S.of(context).category))
                            ? AppColors.mainBlue.withAlpha(100)
                            : AppColors.grey.withAlpha(120),
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            (selectedValue != null ||
                                    (state is SelectLanguage &&
                                        widget.label ==
                                            S.of(context).language) ||
                                    (state is SelectCategory &&
                                        widget.label == S.of(context).category))
                                ? selectedValue ?? widget.hintText
                                : widget.hintText,
                            style: FontHelper.font14BlackW500(context).copyWith(
                              color: selectedValue != null
                                  ? AppColors.mainBlue
                                  : AppColors.greyBlue,
                              fontWeight: selectedValue != null
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: (selectedValue != null ||
                                  (state is SelectLanguage &&
                                      widget.label == S.of(context).language) ||
                                  (state is SelectCategory &&
                                      widget.label == S.of(context).category))
                              ? AppColors.mainBlue
                              : AppColors.greyBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showCategoryBottomSheet(
      BuildContext context, List<Map<String, dynamic>> categories) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.grey.withAlpha(255),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainBlue,
                            AppColors.mainBlue.withAlpha(200),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Iconsax.category,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    horizontalSpacing(12),
                    Text(
                      S.of(context).select_category,
                      style: FontHelper.font20BlackW700(context).copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected =
                        widget.cubit.selectedCategory == category['name'];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  AppColors.mainBlue.withAlpha(30),
                                  AppColors.mainBlue.withAlpha(20),
                                ],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.mainBlue.withAlpha(100)
                              : AppColors.grey.withAlpha(60),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 4.h,
                        ),
                        leading: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: category['color'].withAlpha(30),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            category['icon'],
                            color: category['color'],
                            size: 20.sp,
                          ),
                        ),
                        title: Text(
                          category['name'],
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color: isSelected
                                ? AppColors.mainBlue
                                : AppColors.darkBlue,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                        trailing: isSelected
                            ? Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                  color: AppColors.mainBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                              )
                            : null,
                        onTap: () {
                          widget.cubit.selectCategory(category['name'],
                              category['categoryId']);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.grey.withAlpha(100),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainBlue,
                            AppColors.mainBlue.withAlpha(200),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Iconsax.translate,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    horizontalSpacing(12),
                    Text(
                      S.of(context).select_course_language,
                      style: FontHelper.font20BlackW700(context).copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: widget.cubit.languages.length,
                  itemBuilder: (context, index) {
                    final language = widget.cubit.languages[index];
                    final isSelected =
                        widget.cubit.selectedLanguage == language['name'];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  AppColors.mainBlue.withAlpha(30),
                                  AppColors.mainBlue.withAlpha(20),
                                ],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.mainBlue.withAlpha(100)
                              : AppColors.grey.withAlpha(60),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 4.h,
                        ),
                        leading: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.mainBlue.withAlpha(30),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            language['flag'],
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                        title: Text(
                          language['name'],
                          style: FontHelper.font15BlackW600(context).copyWith(
                            color: isSelected
                                ? AppColors.mainBlue
                                : AppColors.darkBlue,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          language['native'],
                          style: FontHelper.font12lackW400(context).copyWith(
                            color: AppColors.greyBlue,
                          ),
                        ),
                        trailing: isSelected
                            ? Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(
                                  color: AppColors.mainBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                              )
                            : null,
                        onTap: () {
                          widget.cubit.selectLanguage(language['name']);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
