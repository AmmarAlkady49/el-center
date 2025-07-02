import 'package:e_learning_app/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../generated/l10n.dart';

class EmailAndPasswordTextFormField extends StatefulWidget {
  const EmailAndPasswordTextFormField({super.key});

  @override
  State<EmailAndPasswordTextFormField> createState() =>
      _EmailAndPasswordTextFormFieldState();
}

class _EmailAndPasswordTextFormFieldState
    extends State<EmailAndPasswordTextFormField> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isObscureText = true;

  @override
  void initState() {
    super.initState();
    _emailController = context.read<LoginCubit>().emailController;
    _passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${S.of(context).email}:',
            style: FontHelper.font16BlackW600(context),
          ),
          verticalSpacing(8),
          AppTextFormField(
            hintText: S.of(context).typeYourEmail,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) =>
                context.read<LoginCubit>().validateEmail(value, context),
          ),
          verticalSpacing(20),
          Text(
            '${S.of(context).password}:',
            style: FontHelper.font16BlackW600(context),
          ),
          verticalSpacing(8),
          AppTextFormField(
            hintText: S.of(context).typeYourPassword,
            controller: _passwordController,
            validator: (value) =>
                context.read<LoginCubit>().validatePassword(value, context),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            isObscureText: _isObscureText,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isObscureText = !_isObscureText;
                });
              },
              child: Icon(
                _isObscureText ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.black54,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
