import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';

class OrLoginWithWidget extends StatelessWidget {
  const OrLoginWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade300,
            indent: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Text(
            S.of(context).orLoginWith,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: Colors.black54,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade300,
            endIndent: 0,
          ),
        ),
      ],
    );
  }
}
