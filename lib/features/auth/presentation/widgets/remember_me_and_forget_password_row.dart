import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgotPasswordRow extends StatefulWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  State<RememberMeAndForgotPasswordRow> createState() =>
      _RememberMeAndForgotPasswordRowState();
}

class _RememberMeAndForgotPasswordRowState
    extends State<RememberMeAndForgotPasswordRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isChecked,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              activeColor: AppColors.mainBlue,
            ),
            Text(
              S.of(context).rememberMe,
              style: FontHelper.font14BlackW500(context).copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              overlayColor: Colors.black45),
          child: Text(
            S.of(context).forgotPassword,
            style: FontHelper.font15BlackW400(context).copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
