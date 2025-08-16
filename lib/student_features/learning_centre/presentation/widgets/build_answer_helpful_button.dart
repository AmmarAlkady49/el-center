import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../logic/cubit/learning_centre_cubit.dart';
import '../../logic/cubit/learning_centre_state.dart';

class BuildAsnwerHelpfulButton extends StatelessWidget {
  final AnswerModelForQAndA answer;
  final LearningCentreCubit cubit;
  const BuildAsnwerHelpfulButton(
      {super.key, required this.answer, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningCentreCubit, LearningCentreState>(
      bloc: cubit,
      buildWhen: (previous, current) => (current is SuccessMarkAnswerHelpful &&
          current.answerId == answer.id),
      builder: (context, state) {
        return InkWell(
          onTap: () {
            cubit.markAnswerHelpful(query: {"answerId": answer.id});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: (state is SuccessMarkAnswerHelpful &&
                        state.answerId == answer.id)
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
                        state.answerId == answer.id)
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
                          state.answerId == answer.id)
                      ? Colors.blue
                      : Colors.grey,
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  state is SuccessMarkAnswerHelpful
                      ? "${answer.helpfulCount + 1}"
                      : "${answer.helpfulCount}",
                  style: FontHelper.font12lackW400(context).copyWith(
                    color: (state is SuccessMarkAnswerHelpful &&
                            state.answerId == answer.id)
                        ? Colors.blue
                        : Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  S.of(context).helpful,
                  style: FontHelper.font15BlackW600(context).copyWith(
                    color: (state is SuccessMarkAnswerHelpful &&
                            state.answerId == answer.id)
                        ? Colors.blue
                        : Colors.grey,
                    fontSize: 13.sp,
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
