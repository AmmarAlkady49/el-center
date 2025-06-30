import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
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
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(100),
                  blurRadius: 1,
                  spreadRadius: 2.5,
                  offset: const Offset(0, 0),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isObscureText ?? false,
        focusNode: _focusNode,
        style: FontHelper.font16BlackW500(context),
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 18.0.h),
          hintText: widget.hintText,
          hintStyle: FontHelper.font15BlackW400(context).copyWith(
            color: Colors.black54,
          ),
          // filled: true,
          // fillColor: AppColors.backgroundWiteColor,
          suffixIcon: widget.suffixIcon,

          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                    color: AppColors.mainBlue.withAlpha(175), width: 1.3),
              ),
          enabledBorder: widget.enabledBorder ??
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
          errorStyle: FontHelper.font15BlackW400(context).copyWith(
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
