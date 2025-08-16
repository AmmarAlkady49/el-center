import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/question_model_for_q_and_a.dart';
import '../../logic/cubit/learning_centre_cubit.dart';
import '../../logic/cubit/learning_centre_state.dart';

class BuildQuestionHelpfulButton extends StatelessWidget {
  final QuestionModelForQAndA question;
  final LearningCentreCubit cubit;
  const BuildQuestionHelpfulButton(
      {super.key, required this.question, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningCentreCubit, LearningCentreState>(
      bloc: cubit,
      buildWhen: (previous, current) => (current is SuccessMarkAnswerHelpful &&
          current.questionId == question.id),
      builder: (context, state) {
        return InkWell(
          onTap: () {
            cubit.markAnswerHelpful(query: {"questionId": question.id});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: (state is SuccessMarkAnswerHelpful &&
                        state.answerId == question.id)
                    ? [
                        Colors.blue.withAlpha(40),
                        Colors.blue.withAlpha(50),
                      ]
                    : [
                        Colors.grey.withAlpha(35),
                        Colors.grey.withAlpha(50),
                      ],
              ),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: (state is SuccessMarkAnswerHelpful &&
                        state.answerId == question.id)
                    ? Colors.blue.withAlpha(60)
                    : Colors.grey.withAlpha(60),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up_alt_rounded,
                  color: (state is SuccessMarkAnswerHelpful &&
                          state.questionId == question.id)
                      ? Colors.blue
                      : Colors.grey,
                  size: 15.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  state is SuccessMarkAnswerHelpful
                      ? "${question.helpfulCount + 1}"
                      : "${question.helpfulCount}",
                  style: FontHelper.font12lackW400(context).copyWith(
                    color: (state is SuccessMarkAnswerHelpful &&
                            state.questionId == question.id)
                        ? Colors.blue
                        : Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  S.of(context).helpful,
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: (state is SuccessMarkAnswerHelpful &&
                            state.questionId == question.id)
                        ? Colors.blue
                        : Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
