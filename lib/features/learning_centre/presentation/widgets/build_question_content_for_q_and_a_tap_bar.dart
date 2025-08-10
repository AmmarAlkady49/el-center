import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../data/model/question_model_for_q_and_a.dart';
import 'build_question_helpful_button.dart';

class BuildQuestionContentForQAndATapBar extends StatelessWidget {
  final QuestionModelForQAndA question;
  final List<AnswerModelForQAndA> answers;
  final LearningCentreCubit cubit;
  final String userId;

  const BuildQuestionContentForQAndATapBar({
    super.key,
    required this.question,
    required this.answers,
    required this.cubit,
    required this.userId,
  });

  bool get isCurrentUser => userId == question.createdById;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestionContainer(context),
        verticalSpacing(16),
        _buildActionRow(context),
      ],
    );
  }

  Widget _buildQuestionContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.mainBlue.withAlpha(30),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.mainBlue.withAlpha(90),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.help_outline,
                color: AppColors.mainBlue,
                size: 18.sp,
              ),
              horizontalSpacing(8),
              Text(
                S.of(context).question,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: AppColors.mainBlue,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          Text(
            question.question,
            style: FontHelper.font15BlackW600(context).copyWith(
              color: AppColors.darkBlue,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      children: [
        BuildQuestionHelpfulButton(
          question: question,
          cubit: cubit,
        ),
        horizontalSpacing(12),
        _buildReplyButton(context),
        if (isCurrentUser) ...[
          const Spacer(),
          _buildEditButton(context),
          horizontalSpacing(8),
          _buildDeleteButton(context),
        ],
      ],
    );
  }

  Widget _buildReplyButton(BuildContext context) {
    return InkWell(
      onTap: () {
        HelperDialogs.showReplyBottomSheet(
          context: context,
          question: question,
          onSendPressed: (replyText) {
            cubit.addAnswer(questionId: question.id, answer: replyText);
            Navigator.pop(context);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.mainBlue.withAlpha(60),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.reply,
              color: AppColors.mainBlue,
              size: 15.sp,
            ),
            horizontalSpacing(4),
            Text(
              S.of(context).reply,
              style: FontHelper.font16BlackW500(context).copyWith(
                color: AppColors.mainBlue,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return InkWell(
      onTap: () {
        HelperDialogs.showTextFieldBottomSheet(
          context: context,
          title: S.of(context).edit_answer,
          initialValue: question.question,
          buttonText: S.of(context).update,
          onPressed: (newQuestion) {
            cubit.updateQuestion(
                question: newQuestion, questionId: question.id);
          },
        );
      },
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
              cubit.deleteQuestion(question.id);
              Navigator.of(context).pop();
            },
            title: S.of(context).delete_question,
            message: S.of(context).delete_description,
            buttonText: S.of(context).delete,
          ),
        );
      },
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
