import 'package:e_learning_app/core/data/models/lesson_module.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/widgets/payment_method_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildPriceAndActions extends StatelessWidget {
  final CourseInfoModel courseBasicInfo;
  final bool isEnrolled;
  final CourseDetailsCubit cubit;
  final List<LessonModule> lessons;

  const BuildPriceAndActions(
      {super.key,
      required this.courseBasicInfo,
      required this.isEnrolled,
      required this.lessons,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          isEnrolled
              ? Navigator.pushNamed(context, AppRoutes.lessonPlayer,
                  arguments: {
                      "courseInfo": courseBasicInfo,
                      "courseModules": cubit.courseModules,
                      "lessons": lessons,
                      "modulesWithLessons": cubit.modulesWithLessons,
                      "courseReview": cubit.courseReviews,
                    })
              : showPaymentModal(context,
                  courseTitle: courseBasicInfo.title!,
                  courseID: courseBasicInfo.id,
                  cubit: cubit,
                  coursePrice: courseBasicInfo.price!);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainBlue,
          foregroundColor: Colors.white,
          elevation: 4,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: const BorderSide(color: Colors.black12),
          ),
        ),
        child: Text(
          isEnrolled
              ? S.of(context).continue_learning
              : "${S.of(context).enroll_now} - ${courseBasicInfo.price} ${S.of(context).egp_currency}",
          style: FontHelper.font15BlackW600(context).copyWith(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

void showPaymentModal(BuildContext context,
    {required String courseTitle,
    required double coursePrice,
    required CourseDetailsCubit cubit,
    required int courseID}) {
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
        courseID: courseID,
        coursePrice: "$coursePrice ${S.of(context).egp_currency}",
        onCancel: () => Navigator.pop(context),
        onPaymentMethodSelected: (method) {
          Navigator.pop(context);
        },
      ),
    ),
  );
}
