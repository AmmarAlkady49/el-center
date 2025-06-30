import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final String text;
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.borderSide,
      this.foregroundColor,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.textStyle,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shadowColor: WidgetStateProperty.all<Color>(Colors.black54),
        elevation: WidgetStateProperty.all<double>(8.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
            side: borderSide ??
                BorderSide(
                    color: AppColors.secondaryBlue.withAlpha(100),
                    width: 1.3.w),
          ),
        ),
        foregroundColor:
            WidgetStateProperty.all<Color>(foregroundColor ?? Colors.white),
        backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? AppColors.mainBlue),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 16.0.w,
              vertical: verticalPadding ?? 12.0.h),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          textStyle ?? FontHelper.font16BlackW600(context),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
