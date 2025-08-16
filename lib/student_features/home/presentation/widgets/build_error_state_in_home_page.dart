import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/home_cubit.dart';

class BuildErrorStateInHomePage extends StatelessWidget {
  final String error;
  final HomeCubit cubit;
  const BuildErrorStateInHomePage(
      {super.key, required this.error, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error illustration
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red.withAlpha(30),
                    Colors.red.withAlpha(10),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48.sp,
                color: Colors.red.withAlpha(175),
              ),
            ),

            SizedBox(height: 24.h),

            // Title
            Text(
              S.of(context).something_went_wrong,
              style: FontHelper.font20BlackW700(context).copyWith(
                letterSpacing: 0.5,
              ),
            ),

            SizedBox(height: 12.h),

            // Error message
            Text(
              error.isNotEmpty
                  ? error
                  : "Unable to load courses. Please try again.",
              style: FontHelper.font14BlackW500(context).copyWith(
                letterSpacing: 0.5,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 32.h),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Go back button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.5,
                      ),
                      foregroundColor: Colors.grey.shade700,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          size: 18.sp,
                          color: Colors.grey.shade700,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          S.of(context).go_back,
                          style: FontHelper.font14BlackW500(context).copyWith(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
