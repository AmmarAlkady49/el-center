import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final bool? isObscureText;
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.contentPadding,
    this.suffixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator!(value);
      },
      obscureText: isObscureText ?? false,
      style: FontHelper.font16BlackW500(context),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 18.0.h),
        hintText: hintText,
        hintStyle: FontHelper.font15BlackW400(context).copyWith(
          color: Colors.black54,
        ),
        // filled: true,
        // fillColor: AppColors.backgroundWiteColor,
        suffixIcon: suffixIcon,

        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: AppColors.mainBlue, width: 1.5),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: AppColors.grey, width: 1.3),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: AppColors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
        errorStyle: FontHelper.font12lackW400(context).copyWith(
          color: AppColors.red,
        ),
      ),
    );
  }
}
