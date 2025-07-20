import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/course_details_state.dart';

class PaymentMethodModal extends StatefulWidget {
  final String courseTitle;
  final int courseID;
  final String coursePrice;
  final VoidCallback? onCancel;
  final CourseDetailsCubit cubit;
  final Function(String)? onPaymentMethodSelected;

  const PaymentMethodModal({
    super.key,
    required this.courseTitle,
    required this.courseID,
    required this.coursePrice,
    required this.cubit,
    this.onCancel,
    this.onPaymentMethodSelected,
  });

  @override
  State<PaymentMethodModal> createState() => _PaymentMethodModalState();
}

class _PaymentMethodModalState extends State<PaymentMethodModal> {
  String selectedPaymentMethod = 'card';
  bool showWebView = false;
  String? paymentUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseDetailsCubit, CourseDetailsState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is PaymentRedirectUrl) {
          setState(() {
            showWebView = true;
            paymentUrl = state.url;
          });
        } else if (state is PaymentFailure) {
          setState(() {
            showWebView = false;
          });
          HelperFunctions.showError(state.error, context);
        } else if (state is PaymentSuccess) {
          Navigator.of(context).pop();
          HelperFunctions.showSuccess(S.of(context).payment_success, context);
          widget.cubit.getCourseDetails(widget.courseID);
        }
      },
      child: showWebView && paymentUrl != null
          ? BuildWebView(
              cubit: widget.cubit,
              paymentUrl: paymentUrl,
              onCancel: widget.onCancel!,
            )
          : _buildPaymentOptions(context),
    );
  }

  Widget _buildPaymentOptions(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).choose_payment_method,
                style: FontHelper.font16WhiteW600(context).copyWith(
                  fontSize: 18.sp,
                  color: AppColors.darkGreyBlue,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: widget.onCancel,
                child: const Icon(
                  Icons.close,
                  color: AppColors.greyBlue,
                  size: 24,
                ),
              ),
            ],
          ),
          verticalSpacing(18),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course info
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: FontHelper.font12lackW400(context).copyWith(
                    color: AppColors.darkBlue.withAlpha(150),
                    fontSize: 13.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "${S.of(context).complete_your_enrollment_for} ",
                    ),
                    TextSpan(
                      text: widget.courseTitle,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.darkBlue.withAlpha(230),
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(text: ' (${widget.coursePrice})'),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Payment methods
              _buildPaymentMethodOption(
                'card',
                S.of(context).cridet_card,
                S.of(context).pay_with_your_cridet_card,
                Icons.credit_card,
              ),

              verticalSpacing(12),

              _buildPaymentMethodOption(
                'wallet',
                S.of(context).mobile_wallet,
                S.of(context).pay_with_your_mobile_wallet,
                Iconsax.wallet_1,
              ),

              verticalSpacing(32),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: widget.onCancel,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.mainBlue),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        S.of(context).cancel,
                        style: FontHelper.font15BlackW600(context).copyWith(
                          color: AppColors.mainBlue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.cubit.emitPaymentState(
                            widget.courseID, selectedPaymentMethod);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        S.of(context).pay_now,
                        style: FontHelper.font15BlackW600(context).copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              verticalSpacing(16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption(
    String value,
    String title,
    String subtitle,
    IconData icon,
  ) {
    final isSelected = selectedPaymentMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = value;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.grey,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? AppColors.mainBlue.withAlpha(10)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.mainBlue : AppColors.greyBlue,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.mainBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            horizontalSpacing(12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(125),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.greyBlue,
                size: 24.sp,
              ),
            ),
            horizontalSpacing(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontHelper.font16BlackW600(context).copyWith(
                      color: AppColors.darkGreyBlue,
                      fontSize: 15.sp,
                    ),
                  ),
                  verticalSpacing(2),
                  Text(
                    subtitle,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: AppColors.greyBlue,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
