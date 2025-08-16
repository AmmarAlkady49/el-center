import 'package:e_learning_app/student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_state.dart';

class EmptyQAndAWidget extends StatefulWidget {
  final Function(String)? onAskQuestion;
  final LearningCentreCubit cubit;

  const EmptyQAndAWidget({
    super.key,
    this.onAskQuestion,
    required this.cubit,
  });

  @override
  State<EmptyQAndAWidget> createState() => _EmptyQAndAWidgetState();
}

class _EmptyQAndAWidgetState extends State<EmptyQAndAWidget> {
  final TextEditingController _questionController = TextEditingController();
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _questionController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final isNotEmpty = _questionController.text.trim().isNotEmpty;
    if (isNotEmpty != isTextNotEmpty) {
      setState(() {
        isTextNotEmpty = isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    _questionController.removeListener(_onTextChanged);
    _questionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconContainer(),
          verticalSpacing(16),
          _buildTitleSection(),
          verticalSpacing(20),
          _buildTextField(),
          // if (widget.onAskQuestion != null) ...[
          verticalSpacing(16),
          _buildSendButton(),
          // ],
        ],
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
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
        Iconsax.message_question,
        size: 48.sp,
        color: AppColors.mainBlue,
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          S.of(context).no_questions_yet,
          style: FontHelper.font20BlackW700(context).copyWith(
            color: AppColors.darkBlue,
            fontSize: 18.sp,
          ),
        ),
        verticalSpacing(8),
        Text(
          S.of(context).be_first_to_ask_question,
          style: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.mainBlue,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _questionController,
        maxLines: 3,
        minLines: 1,
        decoration: InputDecoration(
          hintText: S.of(context).ask_your_question_here,
          hintStyle: FontHelper.font14BlackW500(context).copyWith(
            color: AppColors.greyBlue,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
        style: FontHelper.font14BlackW500(context).copyWith(
          fontSize: 14.sp,
          color: AppColors.darkBlue,
        ),
        onSubmitted: (value) {},
      ),
    );
  }

  Widget _buildSendButton() {
    return BlocConsumer<LearningCentreCubit, LearningCentreState>(
      listener: (context, state) {
        if (state is SuccessAddAnswer) {
          _questionController.clear();
          widget.cubit.getAllLessonQuestions(widget.cubit.currentLesson!.id);
          return HelperDialogs.showSuccess(
              'Question added successfully', context);
        } else if (state is FailedAddAnswer) {
          return HelperDialogs.showError(state.error, context);
        }
      },
      bloc: widget.cubit,
      buildWhen: (previous, current) =>
          current is SuccessAddAnswer ||
          current is FailedAddAnswer ||
          current is LoadingAddAnswer,
      listenWhen: (previous, current) =>
          current is SuccessAddAnswer || current is FailedAddAnswer,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: (state is LoadingAddAnswer ||
                      _questionController.text.isEmpty)
                  ? [
                      AppColors.greyBlue,
                      AppColors.greyBlue.withAlpha(190),
                    ]
                  : [
                      AppColors.mainBlue,
                      AppColors.mainBlue.withAlpha(190),
                    ],
            ),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: (state is LoadingAddAnswer ||
                        _questionController.text.isEmpty)
                    ? AppColors.greyBlue.withAlpha(90)
                    : AppColors.mainBlue.withAlpha(90),
                offset: Offset(0, 4.h),
                blurRadius: 8.r,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: () => (state is! LoadingAddAnswer &&
                      _questionController.text.isNotEmpty)
                  ? widget.cubit.addQuestion(
                      lessonId: widget.cubit.currentLesson!.id,
                      question: _questionController.text)
                  : null,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: Text(
                    state is LoadingAddAnswer
                        ? S.of(context).loading
                        : S.of(context).ask_question,
                    style: FontHelper.font16WhiteW600(context).copyWith(
                      fontSize: 16.sp,
                      color: state is LoadingAddAnswer ||
                              _questionController.text.isEmpty
                          ? AppColors.backgroundWiteColor.withAlpha(175)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
