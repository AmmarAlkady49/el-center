import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/font_helper.dart';

PreferredSizeWidget buildGenericAppBar(BuildContext context,
        {required String title,
        Color? backgroundColor,
        double? elevation,
        TextStyle? textStyle,
        Color? iconColor,
        bool hasIconLeading = true, PreferredSize?  bottom}) =>
    AppBar(
      backgroundColor: backgroundColor ?? AppColors.mainBlue,
      elevation: elevation ?? 4,
      leading: hasIconLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: iconColor ?? Colors.white,
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
            )
          : null,
      automaticallyImplyLeading: hasIconLeading,
      title: Text(
        title,
        style: textStyle ??
            FontHelper.font16WhiteW600(context).copyWith(
              shadows: const [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black26,
                )
              ],
              color: Colors.white,
              fontSize: 19.sp,
            ),
      ),
      centerTitle: true,
      bottom: bottom?? PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(
          height: 1.h,
          decoration: BoxDecoration(
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
        ),
      ),
    );
