import 'package:e_learning_app/student_features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/course_details_state.dart';

class BuildCouponCodeSection extends StatefulWidget {
  final int courseId;
  final CourseDetailsCubit courseDetailsCubit;
  const BuildCouponCodeSection({
    super.key,
    required this.courseId,
    required this.courseDetailsCubit,
  });

  @override
  State<BuildCouponCodeSection> createState() => _BuildCouponCodeSectionState();
}

class _BuildCouponCodeSectionState extends State<BuildCouponCodeSection>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && !_isExpanded) {
        _toggleExpansion();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _animationController.dispose();

    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
      _focusNode.unfocus();
    }
  }

  // Method to programmatically collapse the widget
  void _collapseWidget() {
    if (_isExpanded) {
      setState(() {
        _isExpanded = false;
      });
      _animationController.reverse();
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Collapsed state - just the toggle button
        if (!_isExpanded)
          GestureDetector(
            onTap: _toggleExpansion,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // AppColors.mainBlue.withAlpha(30),
                    // AppColors.mainBlue.withAlpha(20),
                    AppColors.mainBlue.withAlpha(10),
                    AppColors.mainBlue.withAlpha(10),
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.mainBlue.withAlpha(100),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.ticket_discount,
                    color: AppColors.mainBlue,
                    size: 20.sp,
                  ),
                  horizontalSpacing(12),
                  Text(
                    S.of(context).have_a_coupon_code,
                    style: FontHelper.font14BlackW500(context).copyWith(
                      color: AppColors.mainBlue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Iconsax.arrow_right_3,
                    color: AppColors.mainBlue,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),

        // Expanded state - full coupon input
        AnimatedBuilder(
          animation: _expandAnimation,
          builder: (context, child) {
            return SizeTransition(
              sizeFactor: _expandAnimation,
              child: GestureDetector(
                onTap: _collapseWidget,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // AppColors.mainBlue.withAlpha(30),
                        // AppColors.mainBlue.withAlpha(20),
                        AppColors.mainBlue.withAlpha(10),
                        AppColors.mainBlue.withAlpha(10),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.mainBlue.withAlpha(60),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with close button
                      Row(
                        children: [
                          Icon(
                            Iconsax.ticket_discount,
                            color: AppColors.mainBlue,
                            size: 22.sp,
                          ),
                          horizontalSpacing(12),
                          Text(
                            '${S.of(context).apply} ${S.of(context).coupon_code}',
                            style: FontHelper.font15BlackW600(context).copyWith(
                              color: AppColors.mainBlue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: _toggleExpansion,
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.grey.shade600,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing(16),

                      // Input field and apply button
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(20),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller:
                                    widget.courseDetailsCubit.couponController,
                                focusNode: _focusNode,
                                onFieldSubmitted: (value) {
                                  _focusNode.unfocus();
                                  widget.courseDetailsCubit
                                      .emitApplyCouponState(
                                    widget.courseId,
                                    widget.courseDetailsCubit.couponController
                                        .text,
                                  );
                                },
                                style: FontHelper.font15BlackW600(context),
                                decoration: InputDecoration(
                                  hintText: S.of(context).coupon_code,
                                  hintStyle: FontHelper.font14BlackW500(context)
                                      .copyWith(
                                    color: Colors.grey.shade500,
                                    fontSize: 14.sp,
                                  ),
                                  prefixIcon: Icon(
                                    Iconsax.edit_2,
                                    color: Colors.grey.shade500,
                                    size: 20.sp,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                      color: AppColors.mainBlue.withAlpha(200),
                                      width: 1.8,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade200,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpacing(12),
                          BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
                            bloc: widget.courseDetailsCubit,
                            buildWhen: (previous, current) =>
                                current is CouponLoading ||
                                current is CouponFailure ||
                                current is CouponSuccess,
                            listener: (context, state) {
                              if (state is CouponSuccess) {
                                widget.courseDetailsCubit.couponController
                                    .clear();
                                // Use a delayed call to ensure the success message shows first
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  _collapseWidget();
                                });
                                HelperDialogs.showSuccess(
                                    S.of(context).coupon_applied, context);
                              } else if (state is CouponFailure) {
                                widget.courseDetailsCubit.couponController
                                    .clear();
                                HelperDialogs.showError(state.error, context);
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.mainBlue,
                                      AppColors.mainBlue.withAlpha(200),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(14.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.mainBlue.withAlpha(60),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(14.r),
                                    onTap: state is CouponLoading
                                        ? null
                                        : () {
                                            if (widget.courseDetailsCubit
                                                .couponController.text
                                                .trim()
                                                .isEmpty) {
                                              HelperDialogs.showError(
                                                  'Please enter a coupon code',
                                                  context);
                                              return;
                                            }
                                            widget.courseDetailsCubit
                                                .emitApplyCouponState(
                                                    widget.courseId,
                                                    widget.courseDetailsCubit
                                                        .couponController.text
                                                        .trim());
                                          },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      child: Center(
                                        child: state is CouponLoading
                                            ? SizedBox(
                                                width: 20.w,
                                                height: 20.h,
                                                child:
                                                    CupertinoActivityIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                S.of(context).apply,
                                                style:
                                                    FontHelper.font15BlackW600(
                                                            context)
                                                        .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
