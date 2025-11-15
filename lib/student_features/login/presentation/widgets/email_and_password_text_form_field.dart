import 'package:e_learning_app/student_features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class EmailAndPasswordTextFormField extends StatefulWidget {
  final LoginCubit cubit;
  const EmailAndPasswordTextFormField({super.key, required this.cubit});

  @override
  State<EmailAndPasswordTextFormField> createState() =>
      _EmailAndPasswordTextFormFieldState();
}

class _EmailAndPasswordTextFormFieldState
    extends State<EmailAndPasswordTextFormField> {
  bool _isObscureText = true;
  bool _emailFocused = false;
  bool _passwordFocused = false;

  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    final emailController = widget.cubit.emailController;
    final passwordController = widget.cubit.passwordController;

    return Form(
      key: widget.cubit.formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            _buildCleanTextField(
              label: S.of(context).email,
              hintText: S.of(context).typeYourEmail,
              controller: emailController,
              prefixIcon: Iconsax.sms,
              errorText: _emailError,
              isFocused: _emailFocused,
              onFocusChange: (focused) =>
                  setState(() => _emailFocused = focused),
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              textInputAction: TextInputAction.next,
            ),

            verticalSpacing(16),

            // Password Field
            _buildCleanTextField(
              label: S.of(context).password,
              hintText: S.of(context).typeYourPassword,
              controller: passwordController,
              prefixIcon: Iconsax.lock,
              isFocused: _passwordFocused,
              errorText: _passwordError,
              onFocusChange: (focused) {
                setState(() => _passwordFocused = focused);
              },
              isObscureText: _isObscureText,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.password],
              textInputAction: TextInputAction.done,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  child: Icon(
                    _isObscureText ? Iconsax.eye_slash : Iconsax.eye,
                    color: Colors.grey.shade500,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildCleanTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required IconData prefixIcon,
    required bool isFocused,
    required Function(bool) onFocusChange,
    String? errorText,
    TextInputType? keyboardType,
    List<String>? autofillHints,
    TextInputAction? textInputAction,
    bool isObscureText = false,
    Widget? suffixIcon,
  }) {
    final hasError = errorText != null && errorText.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: FontHelper.font15BlackW600(context).copyWith(
            color: isFocused ? AppColors.mainBlue : Colors.grey.shade700,
            fontSize: isFocused ? 14.sp : 13.sp,
          ),
          child: Text(label),
        ),
        verticalSpacing(12),
        Focus(
          onFocusChange: onFocusChange,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: hasError
                    ? Colors.red.shade400
                    : (isFocused ? AppColors.mainBlue : Colors.grey.shade300),
                width: (isFocused || hasError) ? 2.w : 1.w,
              ),
              color: Colors.white,
              boxShadow: hasError
                  ? [
                      BoxShadow(
                        color: Colors.red.withAlpha(30),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : (isFocused
                      ? [
                          BoxShadow(
                            color: AppColors.mainBlue.withAlpha(30),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ]),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              autofillHints: autofillHints,
              textInputAction: textInputAction,
              obscureText: isObscureText,
              cursorColor: Colors.black,
              validator: (value) {
                if (label == S.of(context).email) {
                  return widget.cubit.validateEmail(value, context);
                } else if (label == S.of(context).password) {
                  return widget.cubit.validatePassword(value, context);
                }
                return null;
              },
              style: FontHelper.font16BlackW500(context).copyWith(
                color: Colors.grey.shade800,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: FontHelper.font15BlackW400(context).copyWith(
                  color: Colors.grey.shade500,
                  fontSize: 13.sp,
                ),
                prefixIcon: Icon(
                  prefixIcon,
                  color: isFocused ? AppColors.mainBlue : Colors.grey.shade500,
                  size: 22.sp,
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 47.w,
                ),
              ),
            ),
          ),
        ),
        if (hasError) ...[
          verticalSpacing(8.h),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Text(
              errorText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
