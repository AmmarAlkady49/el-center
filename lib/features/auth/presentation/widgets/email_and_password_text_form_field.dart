import 'package:flutter/material.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
