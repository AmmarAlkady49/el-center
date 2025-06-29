import 'package:e_learning_app/core/helpers/extensions.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/theming/font_helper.dart';

class FloatingProgressIndecator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;

  const FloatingProgressIndecator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: currentPage == totalPages - 1,
            child: Text(
              context.loc.startLearning,
              style: FontHelper.font20thinWeight700(context),
            ),
          ),
          CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 200,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundWidth: 5.w,
            radius: 38.r,
            lineWidth: 5.6.w,
            percent: (currentPage + 1) / totalPages,
            progressColor: AppColors.mainBlue,
            backgroundColor: AppColors.mainBlue.withAlpha(30),
            center: IconButton(
              onPressed: onNextPressed,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(AppColors.mainBlue),
                fixedSize: WidgetStateProperty.all<Size>(Size(56.w, 56.h)),
                elevation: WidgetStateProperty.all<double>(8),
                shadowColor: WidgetStateProperty.all<Color>(
                    AppColors.mainBlue.withAlpha(80)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
              ),
              icon: Icon(
                currentPage == totalPages - 1
                    ? Icons.check_rounded
                    : Icons.chevron_right_rounded,
                color: Colors.white,
                size: 32.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
