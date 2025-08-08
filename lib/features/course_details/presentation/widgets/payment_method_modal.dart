import 'dart:developer';

import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/build_web_view.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/coupon_code_sucess_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/lesson_module.dart';
import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/course_details_state.dart';
import 'build_coupon_code_section.dart';

class PaymentMethodModal extends StatefulWidget {
  final String courseTitle;
  final int courseID;
  final CourseInfoModel courseBasicInfo;
  final List<LessonModule> lessons;
  final String coursePrice;
  final VoidCallback? onCancel;
  final CourseDetailsCubit cubit;
  final Function(String)? onPaymentMethodSelected;

  const PaymentMethodModal({
    super.key,
    required this.courseTitle,
    required this.courseID,
    required this.courseBasicInfo,
    required this.lessons,
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.cubit.couponCode = '';
  }

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
          HelperDialogs.showError(state.error, context);
        } else if (state is PaymentSuccess) {
          Future.microtask(() {
            Navigator.of(context).pop();
            HelperDialogs.showSuccess(S.of(context).payment_success, context);
            widget.cubit.getCourseDetails(widget.courseID, widget.courseBasicInfo);
          });
        } else if (state is FreePaymentSuccess) {
          Future.microtask(() {
            Navigator.of(context).pop();
            HelperDialogs.showSuccess(S.of(context).payment_success, context);
            widget.cubit.getCourseDetails(widget.courseID, widget.courseBasicInfo);
          });
        }
      },
      child: showWebView && paymentUrl != null
          ? BuildWebView(
              cubit: widget.cubit,
              paymentUrl: paymentUrl,
              onCancel: widget.onCancel!,
            )
          : _buildPaymentOptions(context, widget.cubit),
    );
  }

  Widget _buildPaymentOptions(BuildContext context, CourseDetailsCubit cubit) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
            current is PaymentLoading ||
            current is PaymentFailure ||
            current is PaymentSuccess ||
            current is CouponSuccess,
        builder: (context, state) {
          final bool hasCouponApplied = state is CouponSuccess;
          final String originalPrice =
              "${widget.coursePrice} ${S.of(context).egp_currency}";
          final String finalPrice = hasCouponApplied
              ? "${state.returnFinalPrice} ${S.of(context).egp_currency}"
              : originalPrice;
          cubit.finalPrice = finalPrice;
          return Column(
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
                        style: FontHelper.font15BlackW600(context).copyWith(
                          color: AppColors.darkBlue.withAlpha(150),
                          fontSize: 12.sp,
                        )),
                    TextSpan(
                      text: widget.courseTitle,
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.darkBlue.withAlpha(230),
                        fontSize: 13.sp,
                      ),
                    ),
                    TextSpan(
                        text:
                            ' (${widget.coursePrice.split('.')[0]}.0 ${S.of(context).egp_currency})',
                        style: FontHelper.font15BlackW600(context).copyWith(
                          color: AppColors.darkBlue.withAlpha(150),
                          fontSize: 12.sp,
                        )),
                  ],
                ),
              ),

              verticalSpacing(18),

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

              verticalSpacing(12),

              // build coupon code
              BuildCouponCodeSection(
                courseDetailsCubit: cubit,
                courseId: widget.courseID,
              ),
              verticalSpacing(12),
              if (hasCouponApplied) ...[
                CouponCodeSucessWidget(
                  originalPrice: originalPrice,
                  returnFinalPrice: finalPrice,
                  coursePrice: widget.coursePrice,
                ),
              ],
              verticalSpacing(24),

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
                        log("coupon code:${widget.cubit.couponCode}");
                        int.parse(cubit.finalPrice.split('.').first) == 0
                            ? widget.cubit.emitPaymentState(
                                widget.courseID,
                                selectedPaymentMethod,
                                widget.cubit.couponCode,
                                int.parse(cubit.finalPrice.split('.').first),
                              )
                            : widget.cubit.emitPaymentState(
                                widget.courseID,
                                selectedPaymentMethod,
                                widget.cubit.couponCode,
                                int.parse(cubit.finalPrice.split('.').first),
                              );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: state is PaymentLoading
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              hasCouponApplied
                                  ? S.of(context).startLearning
                                  : S.of(context).pay_now,
                              style:
                                  FontHelper.font15BlackW600(context).copyWith(
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
          );
        },
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
