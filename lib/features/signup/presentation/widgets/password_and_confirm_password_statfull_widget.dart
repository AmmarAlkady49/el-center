import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/signup_cubit.dart';

class PasswordAndConfirmPasswordStatfullWidget extends StatefulWidget {
  const PasswordAndConfirmPasswordStatfullWidget({super.key});

  @override
  State<PasswordAndConfirmPasswordStatfullWidget> createState() =>
      _PasswordAndConfirmPasswordStatfullWidgetState();
}

class _PasswordAndConfirmPasswordStatfullWidgetState
    extends State<PasswordAndConfirmPasswordStatfullWidget> {
  bool _isObscureText1 = true;
  bool _isObscureText2 = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          hintText: S.of(context).password,
          isObscureText: _isObscureText1,
          controller: cubit.passwordController,
          validator: (value) => cubit.validatePassword(value, context),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isObscureText1 = !_isObscureText1;
              });
            },
            child: Icon(
              _isObscureText1 ? Iconsax.eye_slash : Iconsax.eye,
              color: Colors.black54,
              size: 22.sp,
            ),
          ),
        ),
        const SizedBox(height: 14),
        AppTextFormField(
          hintText: S.of(context).confirmPassword,
          controller: cubit.confirmPasswordController,
          validator: (value) => cubit.validateConfirmPassword(
              value, cubit.passwordController.text, context),
          isObscureText: _isObscureText2,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isObscureText2 = !_isObscureText2;
              });
            },
            child: Icon(
              _isObscureText2 ? Iconsax.eye_slash : Iconsax.eye,
              color: Colors.black54,
              size: 22.sp,
            ),
          ),
        ),
      ],
    );
  }
}
