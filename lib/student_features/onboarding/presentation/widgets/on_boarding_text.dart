import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helper_functions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';

class OnBoardingText extends StatelessWidget {
  final String thinTitle;
  final String boldTitle;
  final String highlightedTitle;
  final bool isBoldTitleNeeded;
  const OnBoardingText({
    super.key,
    required this.thinTitle,
    required this.boldTitle,
    required this.highlightedTitle,
    required this.isBoldTitleNeeded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            thinTitle,
            style: FontHelper.font24Black45W300(context),
          ),
          SizedBox(height: 7.h),
          Visibility(
            visible: isBoldTitleNeeded,
            child: Text(
              boldTitle,
              style: FontHelper.font24BlackW700(context).copyWith(
                height: 0.8,
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: HelperFunctions.getWordWidth(
                      highlightedTitle, FontHelper.font24BlackW700(context)),
                  height: 10.h,
                  decoration: BoxDecoration(color: AppColors.mainBlue),
                ),
              ),
              Text(
                highlightedTitle,
                style: FontHelper.font24BlackW700(context).copyWith(
                  height: 1.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
