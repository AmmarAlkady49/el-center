import 'dart:developer';

import 'package:e_learning_app/core/helpers/helper_functions.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/answer_model_for_q_and_a.dart';
import '../../data/model/question_model_for_q_and_a.dart';
import '../../logic/cubit/learning_centre_state.dart';

class BuildQAndATapBarView extends StatefulWidget {
  final LearningCentreCubit cubit;
  const BuildQAndATapBarView({super.key, required this.cubit});

  @override
  State<BuildQAndATapBarView> createState() => _BuildQAndATapBarViewState();
}

class _BuildQAndATapBarViewState extends State<BuildQAndATapBarView> {
  final TextEditingController _answerController = TextEditingController();
  late String userId;

  @override
  void initState() {
    super.initState();
    _getAsyncData();
    widget.cubit.getAllLessonQuestions(widget.cubit.currentLesson!.id);
  }

  void _getAsyncData() async {
    userId = await SharedPrefHelper.getString('userId');
    log("userId: $userId");
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
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
            current is FailedMarkAnswerHelpful,
        listener: (context, state) {
          if (state is SuccessDeleteAnswerOrQuestion) {
            widget.cubit.getAllLessonQuestions(widget.cubit.currentLesson!.id);
          }
          if (state is FailedDeleteAnswerOrQuestion) {
            return HelperFunctions.showError(state.error, context);
          }
          if (state is SuccessSendReport) {
            log("report sent successfully");
            return HelperFunctions.showSuccess(
                S.of(context).report_sent_successfully, context);
          }
          if (state is FailedSendReport) {
            return HelperFunctions.showError(state.error, context);
          }

          if (state is FailedMarkAnswerHelpful) {
            return HelperFunctions.showError(state.error, context);
          }
        },
        builder: (context, state) {
          if (state is GettingQAndAtap) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is SuccessGettingQAndAData) {
            return _buildQAList(state, userId);
          } else if (state is FailedGettingQAndA) {
            return _buildErrorState(state.error);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildQAList(SuccessGettingQAndAData state, String userId) {
    return ListView.separated(
      itemCount: state.questions.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final question = state.questions[index];
        final answers = state.answers
            .where((answer) => answer.questionId == question.id)
            .toList();
        return _buildQuestionCard(question, answers, userId, state);
      },
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48.w,
            color: AppColors.red.withAlpha(175),
          ),
          SizedBox(height: 16.h),
          Text(
            error,
            style: FontHelper.font16BlackW500(context).copyWith(
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
            _buildQuestionContent(question, answers),

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
                      title: HelperFunctions.formatTimeAgo3(
                          DateTime.parse(question.createdAt)),
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
            child: AnimatedRotation(
              turns: true ? 0.50 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.mainBlue,
                size: 21.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionContent(
      QuestionModelForQAndA question, List<AnswerModelForQAndA> answers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Modern question container with glassmorphism effect
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.mainBlue.withAlpha(30),
                AppColors.mainBlue.withAlpha(50),
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
                blurRadius: 10,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question icon and label
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue.withAlpha(40),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.help_outline_rounded,
                      color: AppColors.mainBlue,
                      size: 18.sp,
                    ),
                  ),
                  horizontalSpacing(12),
                  Text(
                    S.of(context).question,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      color: AppColors.mainBlue.withAlpha(200),
                    ),
                  ),
                ],
              ),
              verticalSpacing(16),
              // Question text with modern typography
              Text(
                question.question,
                style: FontHelper.font15BlackW600(context).copyWith(
                  color: AppColors.darkBlue,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        verticalSpacing(16),

        // Modern response count badge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Interaction stats
            Row(
              children: [
                _buildModernStatBadge(
                  icon: Icons.question_answer_rounded,
                  count: answers.length,
                  label: answers.length == 1
                      ? S.of(context).answer
                      : S.of(context).answers,
                  color: answers.isEmpty ? AppColors.grey : AppColors.mainBlue,
                ),
              ],
            ),
            // Delete button
            InkWell(
              onTap: () => widget.cubit.deleteQuestion(question.id),
              child: Visibility(
                visible: userId == question.createdById,
                child: _buildModernStatBadge(
                  label: S.of(context).delete,
                  // title: S.of(context).delete,
                  count: null,
                  icon: Icons.delete,
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),

        verticalSpacing(12),

        // Modern divider
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.grey.withAlpha(100),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerWidget(
      AnswerModelForQAndA answer, String userId, LearningCentreState state) {
    final bool isCurrentUser = userId == answer.createdById;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Modern answer container
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: answer.isInstructor
                  ? AppColors.mainBlue.withAlpha(60)
                  : AppColors.grey.withAlpha(150),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: answer.isInstructor
                    ? AppColors.mainBlue.withAlpha(40)
                    : Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Enhanced header with better visual hierarchy
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Enhanced profile image with status indicator
                  Stack(
                    children: [
                      HelperFunctions.getInstructorImage(
                          answer.creatorImage, 42),
                      if (answer.isInstructor)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.mainBlue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.school_rounded,
                              color: Colors.white,
                              size: 8.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                  horizontalSpacing(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Enhanced name and role section
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                answer.createdByName,
                                style: FontHelper.font15BlackW600(context)
                                    .copyWith(
                                  color: AppColors.darkBlue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (answer.isInstructor) ...[
                              horizontalSpacing(8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.mainBlue,
                                      AppColors.mainBlue.withAlpha(200),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.mainBlue.withAlpha(90),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.verified_rounded,
                                      color: Colors.white,
                                      size: 12.sp,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      S.of(context).instructor,
                                      style: FontHelper.font12lackW400(context)
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                        verticalSpacing(6),
                        // Enhanced metadata row
                        Row(
                          children: [
                            _buildModernMetadataChip(
                              icon: Icons.schedule_rounded,
                              text: HelperFunctions.formatTimeAgo3(
                                  DateTime.parse(answer.createdAt)),
                              color: AppColors.darkBlue.withOpacity(0.7),
                            ),
                            if (answer.isEdited) ...[
                              SizedBox(width: 8.w),
                              _buildModernMetadataChip(
                                icon: Icons.edit_rounded,
                                text: S.of(context).edited,
                                color: Colors.orange,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              verticalSpacing(16),

              // Enhanced answer content with better typography
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.withAlpha(10),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.mainBlue.withAlpha(30),
                    width: 1,
                  ),
                ),
                child: Text(
                  answer.answer,
                  style: FontHelper.font12lackW400(context).copyWith(
                    color: AppColors.darkBlue,
                    fontSize: 15.sp,
                    height: 1.6,
                    letterSpacing: 0.1,
                  ),
                ),
              ),

              verticalSpacing(16),

              // Enhanced action buttons with modern design
              Row(
                children: [
                  // Enhanced helpful button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        final query = {
                          "answerId": answer.id,
                          // optionally add other params
                        }..removeWhere((key, value) => value == null);
                        widget.cubit.markAnswerHelpful(query: query);
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child:
                          BlocBuilder<LearningCentreCubit, LearningCentreState>(
                        bloc: widget.cubit,
                        buildWhen: (previous, current) =>
                            current is SuccessMarkAnswerHelpful ||
                            current is FailedMarkAnswerHelpful,
                        builder: (context, state) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.withAlpha(30),
                                  Colors.blue.withAlpha(10),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: Colors.blue.withAlpha(60),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: Colors.blue,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  state is SuccessMarkAnswerHelpful
                                      ? "${answer.helpfulCount + 1}"
                                      : "${answer.helpfulCount}",
                                  style: FontHelper.font12lackW400(context)
                                      .copyWith(
                                    color: Colors.blue,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  S.of(context).helpful,
                                  style: FontHelper.font12lackW400(context)
                                      .copyWith(
                                    color: Colors.blue,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Report button (only visible if not instructor and not current user)
                  if (userId != answer.createdById && !answer.isInstructor) ...[
                    horizontalSpacing(12),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              HelperFunctions.showReportOrDeleteDialog(
                            context: context,
                            onPressed: () {
                              widget.cubit.sendReport(
                                query: {
                                  "questionId": null,
                                  "answerId": answer.id,
                                  "reason": "Spam",
                                },
                              );
                              Navigator.of(context).pop();
                            },
                            title: S.of(context).report_answer,
                            message: S.of(context).report_description,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.red.withAlpha(30),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.red.withAlpha(60),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          CupertinoIcons.flag,
                          color: AppColors.red,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ],

                  // Delete button (only visible for current user)
                  if (isCurrentUser) ...[
                    horizontalSpacing(12),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              HelperFunctions.showReportOrDeleteDialog(
                            context: context,
                            onPressed: () {
                              context
                                  .read<LearningCentreCubit>()
                                  .deleteAnswer(answer.id);
                              Navigator.of(context).pop();
                            },
                            title: S.of(context).delete,
                            message: S.of(context).delete_description,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.red.withAlpha(30),
                          borderRadius: BorderRadius.circular(16.r),
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

  Widget _buildModernMetadataChip({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withAlpha(60),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12.sp,
            color: color,
          ),
          SizedBox(width: 4.w),
          Text(
            text,
            style: FontHelper.font12lackW400(context).copyWith(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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
          itemBuilder: (context, index) =>
              _buildAnswerWidget(answers[index], userId, state),
          separatorBuilder: (context, index) => Divider(color: AppColors.grey),
          itemCount: answers.length,
        ),
      ],
    );
  }

  Widget _buildModernStatBadge({
    required IconData icon,
    required int? count,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withAlpha(35),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withAlpha(60),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14.w,
            color: color,
          ),
          SizedBox(width: 6.w),
          Text(
            count == null ? label : '$count $label',
            style: FontHelper.font12lackW400(context).copyWith(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
