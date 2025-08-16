import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSmallActionButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color color;
  const BuildSmallActionButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: color.withAlpha(60),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: color,
          size: 14.sp,
        ),
      ),
    );
  }
}
