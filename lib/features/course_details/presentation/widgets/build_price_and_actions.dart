import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import 'payment_method_modal.dart';

class BuildPriceAndActions extends StatelessWidget {
  final CourseInfoModel courseBasicInfo;
  final bool isEnrolled;
  final CourseDetailsCubit cubit;
  final List<LessonModule> lessons;

  const BuildPriceAndActions({
    super.key,
    required this.courseBasicInfo,
    required this.isEnrolled,
    required this.lessons,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isEnrolled) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue.withAlpha(30),
                  AppColors.mainBlue.withAlpha(20),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.mainBlue.withAlpha(60),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(20),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.tag,
                  color: AppColors.mainBlue,
                  size: 22.sp,
                ),
                horizontalSpacing(10),
                Text(
                  "${courseBasicInfo.price} ${S.of(context).egp_currency}",
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: AppColors.mainBlue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(12),
        ],

        // Action buttons row
        Container(
          height: 49.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.mainBlue,
                AppColors.mainBlue.withAlpha(190),
              ],
            ),
            borderRadius: BorderRadius.circular(16.r),
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
              borderRadius: BorderRadius.circular(16.r),
              onTap: () => _handleMainButtonPress(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isEnrolled ? Iconsax.play : Iconsax.shopping_cart,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  horizontalSpacing(12),
                  Text(
                    isEnrolled
                        ? S.of(context).continue_learning
                        : (!isEnrolled && courseBasicInfo.price == 0)
                            ? S.of(context).start_your_free_course
                            : S.of(context).enroll_now,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleMainButtonPress(
    BuildContext context,
  ) {
    if (isEnrolled) {
      Navigator.pushNamed(context, AppRoutes.lessonPlayer, arguments: {
        "courseInfo": courseBasicInfo,
        "courseModules": cubit.courseModules,
        "lessons": lessons,
        "modulesWithLessons": cubit.modulesWithLessons,
        "courseReview": cubit.courseReviews,
      });
    } else if (!isEnrolled && courseBasicInfo.price == 0) {
      // TODO: implement free course
      cubit.emitPaymentState(courseBasicInfo.id, 'card', null, 0);
    } else {
      showPaymentModal(context,
          courseTitle: courseBasicInfo.title!,
          courseID: courseBasicInfo.id,
          cubit: cubit,
          coursePrice: courseBasicInfo.price!); 
    }
  }

  void showPaymentModal(
    BuildContext context, {
    required String courseTitle,
    required double coursePrice,
    required CourseDetailsCubit cubit,
    required int courseID,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.all(8.w),
        backgroundColor: Colors.black12,
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.white,
        child: PaymentMethodModal(
          courseTitle: courseTitle,
          cubit: cubit,
          courseBasicInfo: courseBasicInfo,
          lessons: lessons,
          courseID: courseID,
          coursePrice: coursePrice.toString(),
          onCancel: () => Navigator.pop(context),
          onPaymentMethodSelected: (method) {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
