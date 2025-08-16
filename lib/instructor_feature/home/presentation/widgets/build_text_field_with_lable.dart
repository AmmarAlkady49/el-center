import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class BuildTextFieldWithLable extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final int maxLines;
  final TextInputType keyboardType;
  const BuildTextFieldWithLable(
      {super.key,
      required this.label,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
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
          color: AppColors.grey.withAlpha(90),
          width: 1,
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
                    icon,
                    color: AppColors.mainBlue,
                    size: 16.sp,
                  ),
                ),
                horizontalSpacing(10),
                Text(
                  label,
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: FontHelper.font14BlackW500(context).copyWith(
                color: AppColors.darkBlue,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.greyBlue,
                  fontSize: 13.sp,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(120),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(200),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.mainBlue,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                filled: true,
                fillColor: AppColors.grey.withAlpha(40),
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
