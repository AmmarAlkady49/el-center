import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../logic/cubit/search_cubit.dart';

class BuildTextFormFieldForSearchPage extends StatelessWidget {
  final SearchCubit searchCubit;

  const BuildTextFormFieldForSearchPage({
    super.key,
    required this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchCubit.searchController,
        builder: (context, value, child) {
          return TextFormField(
            controller: searchCubit.searchController,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) {
              searchCubit.setSearchQuery(value, null);
            },
            style: FontHelper.font16BlackW500(context),
            decoration: InputDecoration(
              hintText: '${S.of(context).search_for_courses}...',
              hintStyle: FontHelper.font15BlackW400(context).copyWith(
                color: AppColors.greyBlue.withAlpha(175),
              ),
              prefixIcon: Container(
                margin: EdgeInsets.all(12.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.grey.withAlpha(70),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.search_rounded,
                  // color: _isFocused ? AppColors.mainBlue : AppColors.greyBlue,
                  color: AppColors.greyBlue,
                  size: 20.w,
                ),
              ),
              suffixIcon: searchCubit.searchController.text.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.all(12.w),
                      child: GestureDetector(
                        onTap: () {
                          searchCubit.searchController.clear();
                          searchCubit.setSearchQuery('', null);
                        },
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: AppColors.greyBlue.withAlpha(30),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.greyBlue,
                            size: 16.w,
                          ),
                        ),
                      ),
                    )
                  : null,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    color: AppColors.greyBlue.withAlpha(175), width: 1.6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    color: AppColors.mainBlue.withAlpha(175), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
          );
        });
  }
}
