import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/helpers/helper_dialogs.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_helper.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/learning_centre_state.dart';

class CreateNewQuestionWidget extends StatefulWidget {
  final LearningCentreCubit cubit;

  const CreateNewQuestionWidget({
    super.key,
    required this.cubit,
  });

  @override
  State<CreateNewQuestionWidget> createState() =>
      _CreateNewQuestionWidgetState();
}

class _CreateNewQuestionWidgetState extends State<CreateNewQuestionWidget> {
  final TextEditingController controller = TextEditingController();
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final isNotEmpty = controller.text.trim().isNotEmpty;
    if (isNotEmpty != isTextNotEmpty) {
      setState(() {
        isTextNotEmpty = isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundWiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12.r,
            offset: Offset(0, 2.h),
          ),
        ],
        border: Border.all(
          color: AppColors.grey.withAlpha(120),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Text Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withAlpha(40),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.grey.withAlpha(60),
                  width: 1,
                ),
              ),
              child: TextFormField(
                controller: controller,
                style: FontHelper.font16BlackW500(context).copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkGreyBlue,
                ),
                decoration: InputDecoration(
                  hintText: S.of(context).ask_your_question_here,
                  hintStyle: FontHelper.font16BlackW500(context).copyWith(
                    fontSize: 14.sp,
                    color: AppColors.greyBlue.withAlpha(150),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  isDense: true,
                ),
                maxLines: 2,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (_) => widget.cubit.addQuestion(
                  lessonId: widget.cubit.currentLesson!.id,
                  question: controller.text,
                ),
              ),
            ),
          ),

          horizontalSpacing(12),

          // Send Button
          BlocConsumer<LearningCentreCubit, LearningCentreState>(
            bloc: widget.cubit,
            listener: (context, state) {
              if (state is FailedAddAnswer) {
                return HelperDialogs.showError(state.error, context);
              }
              if (state is SuccessAddAnswer) {
                widget.cubit
                    .getAllLessonQuestions(widget.cubit.currentLesson!.id);
                return HelperDialogs.showSuccess(
                    'Question added successfully', context);
              }
            },
            buildWhen: (previous, current) =>
                current is LoadingAddAnswer ||
                current is FailedAddAnswer ||
                current is SuccessAddAnswer,
            listenWhen: (previous, current) =>
                current is LoadingAddAnswer ||
                current is FailedAddAnswer ||
                current is SuccessAddAnswer,
            builder: (context, state) {
              return Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        (state is LoadingAddAnswer || controller.text.isEmpty)
                            ? [
                                AppColors.grey.withAlpha(175),
                                AppColors.grey,
                              ]
                            : [
                                AppColors.mainBlue.withAlpha(175),
                                AppColors.mainBlue,
                              ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                          state is LoadingAddAnswer || controller.text.isEmpty
                              ? AppColors.grey.withAlpha(90)
                              : AppColors.mainBlue.withAlpha(90),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  child: InkWell(
                    onTap:
                        (state is LoadingAddAnswer || controller.text.isEmpty)
                            ? null
                            : () => widget.cubit.addQuestion(
                                  lessonId: widget.cubit.currentLesson!.id,
                                  question: controller.text,
                                ),
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: state is LoadingAddAnswer
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: CupertinoActivityIndicator(
                                  color: AppColors.backgroundWiteColor,
                                ),
                              )
                            : Icon(
                                Iconsax.send_1,
                                size: 20.w,
                                color: AppColors.backgroundWiteColor,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
