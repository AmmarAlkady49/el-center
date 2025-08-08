import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
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
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../logic/cubit/learning_centre_state.dart';
import 'build_answer_helpful_button.dart';

class BuildAnswerContentForQAndATapBar extends StatelessWidget {
  final AnswerModelForQAndA answer;
  final String userId;
  final LearningCentreState state;
  final LearningCentreCubit cubit;

  const BuildAnswerContentForQAndATapBar({
    super.key,
    required this.answer,
    required this.userId,
    required this.state,
    required this.cubit,
  });

  bool get isCurrentUser => userId == answer.createdById;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 6.h, top: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: answer.isInstructor ? AppColors.mainBlue : AppColors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          verticalSpacing(12),
          _buildAnswerContent(context),
          verticalSpacing(16),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        HelperFunctions.getInstructorImage(answer.creatorImage, 36),
        horizontalSpacing(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    answer.createdByName,
                    style: FontHelper.font15BlackW600(context),
                  ),
                  if (answer.isInstructor) ...[
                    horizontalSpacing(8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        S.of(context).instructor,
                        style: FontHelper.font15BlackW600(context).copyWith(
                          color: AppColors.darkGreyBlue,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              verticalSpacing(4),
              Row(
                children: [
                  Text(
                    HelperFunctions.formatTimeAgo3(
                      DateTime.parse(answer.editedAt ?? answer.createdAt),
                    ),
                    style: FontHelper.font12lackW400(context).copyWith(
                      color: AppColors.darkGreyBlue,
                      fontSize: 12.sp,
                    ),
                  ),
                  if (answer.isEdited) ...[
                    Text(
                      ' • ${S.of(context).edited}',
                      style: FontHelper.font12lackW400(context).copyWith(
                        color: Colors.orange,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        answer.answer,
        style: FontHelper.font12lackW400(context).copyWith(
          fontSize: 14.sp,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        BuildAsnwerHelpfulButton(
          answer: answer,
          cubit: cubit,
        ),
        if (!answer.isInstructor && !isCurrentUser) ...[
          horizontalSpacing(12),
          _buildReportButton(context),
        ],
        if (isCurrentUser) ...[
          const Spacer(),
          _buildEditButton(context),
          horizontalSpacing(8),
          _buildDeleteButton(context),
        ],
      ],
    );
  }

  Widget _buildReportButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => HelperDialogs.showReportOrDeleteDialog(
            context: context,
            onPressed: () {
              cubit.sendReport(query: {
                "questionId": null,
                "answerId": answer.id,
                "reason": "Spam",
              });
              Navigator.of(context).pop();
            },
            title: S.of(context).report_answer,
            message: S.of(context).report_description,
          ),
        );
      },
      child: Icon(
        CupertinoIcons.flag,
        color: AppColors.red,
        size: 18.sp,
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return InkWell(
      onTap: () {
        HelperDialogs.showTextFieldBottomSheet(
          context: context,
          title: S.of(context).edit_answer,
          initialValue: answer.answer,
          buttonText: S.of(context).update,
          onPressed: (newName) {
            cubit.updateAnswer(
              answerId: answer.id,
              answer: newName,
            );
          },
        );
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.darkGreyBlue.withAlpha(30),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.darkGreyBlue.withAlpha(60),
            width: 1,
          ),
        ),
        child: Icon(
          Iconsax.edit,
          color: AppColors.darkGreyBlue,
          size: 16.sp,
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => HelperDialogs.showReportOrDeleteDialog(
            context: context,
            onPressed: () {
              context.read<LearningCentreCubit>().deleteAnswer(answer.id);
              Navigator.of(context).pop();
            },
            title: S.of(context).delete_answer,
            message: S.of(context).delete_description,
            buttonText: S.of(context).delete,
          ),
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.red.withAlpha(30),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.red.withAlpha(60),
            width: 1,
          ),
        ),
        child: Icon(
          CupertinoIcons.delete,
          color: AppColors.red,
          size: 16.sp,
        ),
      ),
    );
  }
}
