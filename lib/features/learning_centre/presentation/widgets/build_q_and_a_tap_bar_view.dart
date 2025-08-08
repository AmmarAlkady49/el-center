import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_error_state_for_q_and_a_tap_bar_widget.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/build_question_content_for_q_and_a_tap_bar.dart';
import 'package:e_learning_app/features/learning_centre/presentation/widgets/empty_q_and_a_widget.dart'
    show EmptyQAndAWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../data/model/question_model_for_q_and_a.dart';
import '../../logic/cubit/learning_centre_state.dart';
import 'build_answer_content_for_q_and_a_tap_bar.dart';
import 'create_new_question_at_tap_bar_view_widgets.dart';

class BuildQAndATapBarView extends StatefulWidget {
  final LearningCentreCubit cubit;
  const BuildQAndATapBarView({super.key, required this.cubit});

  @override
  State<BuildQAndATapBarView> createState() => _BuildQAndATapBarViewState();
}

class _BuildQAndATapBarViewState extends State<BuildQAndATapBarView> {
  late String userId;

  @override
  void initState() {
    super.initState();
    _getAsyncData();
    widget.cubit.getAllLessonQuestions(widget.cubit.currentLesson!.id);
  }

  void _getAsyncData() async {
    userId = await SharedPrefHelper.getString('userId');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      child: BlocConsumer<LearningCentreCubit, LearningCentreState>(
        bloc: widget.cubit,
        buildWhen: (previous, current) =>
            current is GettingQAndAtap ||
            current is SuccessGettingQAndAData ||
            current is FailedGettingQAndA ||
            current is SuccessDeleteAnswerOrQuestion ||
            current is FailedDeleteAnswerOrQuestion,
        listenWhen: (previous, current) =>
            current is GettingQAndAtap ||
            current is SuccessGettingQAndAData ||
            current is FailedGettingQAndA ||
            current is SuccessDeleteAnswerOrQuestion ||
            current is SuccessSendReport ||
            current is FailedSendReport ||
            current is FailedDeleteAnswerOrQuestion ||
            current is FailedMarkAnswerHelpful ||
            current is SuccessAddAnswer ||
            current is FailedAddAnswer,
        listener: (context, state) {
          if (state is SuccessDeleteAnswerOrQuestion ||
              state is SuccessAddAnswer) {
            widget.cubit.getAllLessonQuestions(widget.cubit.currentLesson!.id);
          }
          if (state is FailedDeleteAnswerOrQuestion) {
            return HelperDialogs.showError(
              state.error,
              context,
              topPosition: true,
            );
          }
          if (state is FailedAddAnswer) {
            return HelperDialogs.showError(
              state.error,
              context,
              topPosition: true,
            );
          }
          if (state is SuccessSendReport) {
            return HelperDialogs.showSuccess(
                S.of(context).report_sent_successfully, context);
          }
          if (state is FailedSendReport) {
            return HelperDialogs.showError(
              state.error,
              context,
              topPosition: true,
            );
          }

          if (state is FailedMarkAnswerHelpful) {
            return HelperDialogs.showError(
              state.error,
              context,
              topPosition: true,
            );
          }
        },
        builder: (context, state) {
          if (state is GettingQAndAtap) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is SuccessGettingQAndAData) {
            if (state.questions.isEmpty) {
              return EmptyQAndAWidget(
                cubit: widget.cubit,
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  // add Question
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: CreateNewQuestionWidget(cubit: widget.cubit),
                  ),
                  _buildQAList(state, userId),
                ],
              ),
            );
          } else if (state is FailedGettingQAndA) {
            return BuildErrorStateForQAndATapBarWidget(error: state.error);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildQAList(SuccessGettingQAndAData state, String userId) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.questions.length,
      separatorBuilder: (context, index) => Divider(
        height: 16.h,
        color: AppColors.grey,
        endIndent: 20.w,
        indent: 20.w,
      ),
      itemBuilder: (context, index) {
        final question = state.questions[index];
        final answers = state.answers
            .where((answer) => answer.questionId == question.id)
            .toList();
        return _buildQuestionCard(question, answers, userId, state);
      },
    );
  }

  Widget _buildQuestionCard(
      QuestionModelForQAndA question,
      List<AnswerModelForQAndA> answers,
      String userId,
      LearningCentreState state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Header
            _buildQuestionHeader(question),

            verticalSpacing(16),

            // Question Content
            BuildQuestionContentForQAndATapBar(
              question: question,
              answers: answers,
              cubit: widget.cubit,
              userId: userId,
            ),

            verticalSpacing(16),

            // Answers Section
            if (answers.isNotEmpty) ...[
              verticalSpacing(24),
              _buildAnswersSection(answers, userId, state),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionHeader(QuestionModelForQAndA question) {
    return Row(
      children: [
        HelperFunctions.getInstructorImage(question.creatorImage, 40),
        horizontalSpacing(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    question.createdByName,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 14.sp,
                    ),
                  ),
                  horizontalSpacing(6),
                  _buildActionTag(
                      title: question.isInstructor
                          ? S.of(context).instructor
                          : S.of(context).student,
                      icon: question.isInstructor
                          ? Icons.school_rounded
                          : Icons.person_rounded,
                      color: AppColors.darkGreyBlue,
                      deepColor: true),
                ],
              ),
              verticalSpacing(6),
              Row(
                children: [
                  _buildActionTag(
                      title: HelperFunctions.formatTimeAgo3(DateTime.parse(
                          question.editedAt ?? question.createdAt)),
                      icon: Icons.access_time_rounded,
                      color: AppColors.darkBlue),
                  if (question.isEdited) ...[
                    SizedBox(width: 6.w),
                    _buildActionTag(
                        title: S.of(context).edited,
                        icon: Icons.edit_rounded,
                        color: Colors.orange)
                  ],
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.mainBlue.withAlpha(30),
          ),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.mainBlue,
              size: 21.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnswersSection(List<AnswerModelForQAndA> answers, String userId,
      LearningCentreState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Answers List

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BuildAnswerContentForQAndATapBar(
            answer: answers[index],
            userId: userId,
            state: state,
            cubit: widget.cubit,
          ),
          separatorBuilder: (context, index) => Divider(color: AppColors.grey),
          itemCount: answers.length,
        ),
      ],
    );
  }

  Widget _buildActionTag(
      {required String title,
      required IconData icon,
      required Color color,
      bool deepColor = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: deepColor ? color.withAlpha(40) : color.withAlpha(20),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14.w,
            color: deepColor ? color.withAlpha(255) : color.withAlpha(175),
          ),
          SizedBox(width: 4.w),
          Text(
            title,
            style: FontHelper.font12lackW400(context).copyWith(
              color: deepColor ? color.withAlpha(255) : color.withAlpha(175),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
