import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class CouponCodeSucessWidget extends StatelessWidget {
  final String originalPrice;
  final String returnFinalPrice;
  final String coursePrice;

  const CouponCodeSucessWidget(
      {super.key,
      required this.originalPrice,
      required this.returnFinalPrice,
      required this.coursePrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF4CAF50).withAlpha(40),
            const Color(0xFF4CAF50).withAlpha(25),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF4CAF50).withAlpha(80),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withAlpha(30),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Price display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Original price (crossed out if coupon applied)

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).was,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    originalPrice,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 14.sp,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey.shade500,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
              horizontalSpacing(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).now,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: const Color(0xFF4CAF50),
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "${returnFinalPrice.split('.').first}.0 ${S.of(context).egp_currency}",
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: const Color(0xFF4CAF50),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Savings indicator

          verticalSpacing(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(180),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: const Color(0xFF4CAF50).withAlpha(100),
                width: 1,
              ),
            ),
            child: Text(
              '${S.of(context).you_save} ${(double.tryParse(coursePrice.toString()) ?? 0) - (double.tryParse(returnFinalPrice.split(' ').first) ?? 0)} ${S.of(context).egp_currency}',
              style: FontHelper.font15BlackW600(context).copyWith(
                color: const Color(0xFF4CAF50),
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
