import 'package:e_learning_app/student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';

class BuildAiAssistant extends StatelessWidget {
  final LearningCentreCubit cubit;
  const BuildAiAssistant({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue.withAlpha(50),
                  AppColors.mainBlue.withAlpha(25),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Iconsax.cpu_charge,
              size: 48.sp,
              color: AppColors.mainBlue,
            ),
          ),
          verticalSpacing(16),
          Text(
            S.of(context).ai_assistant,
            style: FontHelper.font20BlackW700(context).copyWith(
              color: AppColors.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          verticalSpacing(8),
          Text(
            S.of(context).ask_question_about_the_lesson_content,
            style: FontHelper.font14BlackW500(context).copyWith(
              color: AppColors.greyBlue,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20),
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.mainBlue,
                  AppColors.mainBlue.withAlpha(190),
                ],
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBlue.withAlpha(90),
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.aiChatBot,
                    arguments: cubit,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.message_text,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      horizontalSpacing(8),
                      Text(
                        S.of(context).start_conversation,
                        style: FontHelper.font16WhiteW600(context).copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
