import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';

class AppTextFormField extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final bool? isObscureText;
  final int? maxLength;
  final TextDirection? textDirection;
  const AppTextFormField({
    super.key,
    this.title,
    required this.hintText,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.contentPadding,
    this.suffixIcon,
    this.prefixIcon,
    this.focusedBorder,
    this.enabledBorder,
    this.isObscureText,
    this.maxLength,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox.shrink()
            : Text(title!, style: FontHelper.font16BlackW600(context)),
        title == null ? const SizedBox.shrink() : verticalSpacing(8),
        TextFormField(
          controller: controller,
          validator: (value) {
            return validator!(value);
          },
          obscureText: isObscureText ?? false,
          style: FontHelper.font16BlackW500(context),
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.next,
          cursorColor: Colors.black,
          textDirection: textDirection,
          maxLength: maxLength,
          buildCounter: (_,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
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
            prefixIcon: prefixIcon,
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
        ),
      ],
    );
  }
}
