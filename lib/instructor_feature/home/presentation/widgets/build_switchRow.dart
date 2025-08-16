import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class BuildSwitchrow extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  const BuildSwitchrow(
      {super.key,
      required this.label,
      required this.subtitle,
      required this.icon,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: value
                ? AppColors.mainBlue.withAlpha(30)
                : AppColors.grey.withAlpha(60),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            color: value ? AppColors.mainBlue : AppColors.greyBlue,
            size: 20.sp,
          ),
        ),
        horizontalSpacing(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              verticalSpacing(2),
              Text(
                subtitle,
                style: FontHelper.font12lackW400(context).copyWith(
                  color: AppColors.greyBlue,
                ),
              ),
            ],
          ),
        ),
        Transform.scale(
          scale: 0.9,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppColors.mainBlue,
            inactiveThumbColor: Colors.white,
            trackOutlineWidth: WidgetStateProperty.all(0),
            inactiveTrackColor: AppColors.grey.withAlpha(175),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
