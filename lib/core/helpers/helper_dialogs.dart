import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../student_features/learning_centre/data/model/question_model_for_q_and_a.dart';
import '../../generated/l10n.dart';
import '../theming/app_colors.dart';
import '../theming/font_helper.dart';

class HelperDialogs {
  static void showReplyBottomSheet({
    required BuildContext context,
    required QuestionModelForQAndA question,
    required void Function(String replyText) onSendPressed,
  }) {
    final TextEditingController replyController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20, top: 10),
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Header with better typography
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.greyBlue.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.reply_rounded,
                        color: AppColors.mainBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).reply_to_question,
                              style:
                                  FontHelper.font15BlackW600(context).copyWith(
                                fontSize: 18.sp,
                                color: AppColors.darkGreyBlue,
                                letterSpacing: -0.3,
                              )),
                          const SizedBox(height: 2),
                          Text(
                            question.question,
                            style: FontHelper.font12lackW400(context).copyWith(
                              fontSize: 14.sp,
                              color: AppColors.darkGreyBlue,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                verticalSpacing(24),

                // Modern text field
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyBlue.withAlpha(20),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.greyBlue.withAlpha(60),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: replyController,
                    maxLines: 4,
                    style: FontHelper.font10BlackW500(context).copyWith(
                      fontSize: 16.sp,
                      color: AppColors.darkGreyBlue,
                    ),
                    decoration: InputDecoration(
                      hintText: S.of(context).share_your_thoughts,
                      hintStyle: FontHelper.font12lackW400(context).copyWith(
                        color: AppColors.darkGreyBlue.withAlpha(170),
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),

                verticalSpacing(24),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cancel button
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 24.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        S.of(context).cancel,
                        style: FontHelper.font16BlackW600(context).copyWith(
                          color: AppColors.darkGreyBlue,
                        ),
                      ),
                    ),

                    horizontalSpacing(8),

                    // Send button
                    ElevatedButton(
                      onPressed: () => onSendPressed(replyController.text),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 24.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send_rounded,
                            size: 18,
                          ),
                          horizontalSpacing(8),
                          Text(
                            S.of(context).send,
                            style: FontHelper.font16BlackW600(context).copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget showReportOrDeleteDialog(
      {required BuildContext context,
      required void Function()? onPressed,
      required String title,
      required String message,
      String? buttonText}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 2,
      shadowColor: Colors.black38,
      backgroundColor: AppColors.backgroundWiteColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundWiteColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header with icon
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.red.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.report_problem_rounded,
                size: 32,
                color: AppColors.red,
              ),
            ),
            verticalSpacing(12),

            // Title
            Text(title,
                style: FontHelper.font20BlackW700(context).copyWith(
                  color: AppColors.darkBlue,
                  fontSize: 18.sp,
                )),
            verticalSpacing(12),

            // Description
            Text(
              message,
              style: FontHelper.font16BlackW500(context).copyWith(
                color: AppColors.greyBlue,
                fontSize: 13.sp,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.greyBlue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).cancel,
                    style: FontHelper.font14BlackW500(context)
                        .copyWith(color: AppColors.greyBlue),
                  ),
                ),
                horizontalSpacing(8),
                ElevatedButton(
                  onPressed: onPressed,
                  // () {
                  //   cubit.sendReport(
                  //     query: {
                  //       "questionId": questionId,
                  //       "answerId": answerId,
                  //       "reason": "Spam",
                  //     },
                  //   );
                  //   Navigator.of(context).pop();
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText ?? S.of(context).report,
                    style: FontHelper.font14BlackW500(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // Modern color scheme with better contrast
            colorScheme: ColorScheme.light(
              primary: AppColors.mainBlue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.darkBlue.withAlpha(200),
              onSurfaceVariant: Colors.grey.shade600,
              outline: Colors.grey.shade300,
            ),
            // Enhanced dialog theme
            dialogTheme: DialogThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              elevation: 24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              shadowColor: Colors.black12,
            ),
            // Modern date picker styling
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              headerBackgroundColor: AppColors.mainBlue,
              headerForegroundColor: Colors.white,
              headerHeadlineStyle: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
              headerHelpStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
              weekdayStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
              dayStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              // Modern button styling
              confirmButtonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.mainBlue),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                elevation: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) return 2;
                  return 4;
                }),
                shadowColor: WidgetStateProperty.all(
                  AppColors.mainBlue.withAlpha(90),
                ),
              ),
              cancelButtonStyle: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.grey.shade600),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              // Enhanced day selection styling
              todayBorder: BorderSide(
                color: AppColors.mainBlue.withAlpha(175),
                width: 2,
              ),
              todayForegroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) return Colors.white;
                return AppColors.mainBlue;
              }),
              todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected))
                  return AppColors.mainBlue;
                return Colors.transparent;
              }),
              // // Modern range styling (if needed for date ranges)
              rangeSelectionBackgroundColor: AppColors.mainBlue.withAlpha(50),
              rangeSelectionOverlayColor: WidgetStateProperty.all(
                AppColors.mainBlue.withAlpha(30),
              ),
            ),
            // Enhanced input decoration for text fields
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.mainBlue, width: 2),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      HapticFeedback.lightImpact();
    }
  }

  // Success SnackBar
  static void showSuccess(String message, BuildContext context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(40),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: FontHelper.font16BlackW600(context).copyWith(
                color: Colors.white,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF10B981), // Emerald green
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      duration: const Duration(seconds: 3),
      elevation: 6,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Error SnackBar
  static void showError(String message, BuildContext context,
      {bool topPosition = false}) {
    final snackBar = SnackBar(
      content: Row(
        textDirection: TextDirection.ltr,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(40),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: const Icon(
              Icons.error,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: FontHelper.font16BlackW600(context).copyWith(
                color: Colors.white,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEF4444), // Red
      margin: topPosition
          ? EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 160.h,
              left: 10,
              right: 10)
          : null,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      duration: const Duration(seconds: 4),
      elevation: 6,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showTextFieldBottomSheet({
    required BuildContext context,
    required String title,
    required String initialValue,
    required String buttonText,
    required void Function(String newText) onPressed,
  }) {
    final TextEditingController textEditingController =
        TextEditingController(text: initialValue);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundWiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20, top: 10),
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // Title
                Text(
                  title,
                  style: FontHelper.font15BlackW600(context).copyWith(
                    fontSize: 18.sp,
                    color: AppColors.darkGreyBlue,
                    letterSpacing: -0.3,
                  ),
                ),

                verticalSpacing(20),

                // Editable TextField
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyBlue.withAlpha(20),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.greyBlue.withAlpha(60),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: 4,
                    style: FontHelper.font10BlackW500(context).copyWith(
                      fontSize: 16.sp,
                      color: AppColors.darkGreyBlue,
                    ),
                    decoration: InputDecoration(
                      hintText: title,
                      hintStyle: FontHelper.font12lackW400(context).copyWith(
                        color: AppColors.darkGreyBlue.withAlpha(170),
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),

                verticalSpacing(24),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 24.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        S.of(context).cancel,
                        style: FontHelper.font16BlackW600(context).copyWith(
                          color: AppColors.darkGreyBlue,
                        ),
                      ),
                    ),
                    horizontalSpacing(8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onPressed(textEditingController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 24.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_alt,
                            size: 18.sp,
                          ),
                          horizontalSpacing(8),
                          Text(
                            buttonText,
                            style: FontHelper.font16BlackW600(context).copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static String getRatingText(int rating, BuildContext context) {
    switch (rating) {
      case 1:
        return S.of(context).poor;
      case 2:
        return S.of(context).fair;
      case 3:
        return S.of(context).good;
      case 4:
        return S.of(context).very_good;
      case 5:
        return S.of(context).excellent;
      default:
        return '';
    }
  }

  static void updateCourseReviewBottomSheet({
    required BuildContext context,
    required String title,
    required String initialValue,
    required int initalRating,
    required String buttonText,
    required void Function(String newText, int newRating) onPressed,
  }) {
    final TextEditingController textEditingController =
        TextEditingController(text: initialValue);
    int selectedRating = initalRating;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            decoration: const BoxDecoration(
              color: AppColors.backgroundWiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 12.0,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      decoration: BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // Title
                  Text(
                    title,
                    style: FontHelper.font15BlackW600(context).copyWith(
                      fontSize: 18.sp,
                      color: AppColors.darkGreyBlue,
                      letterSpacing: -0.3,
                    ),
                  ),

                  verticalSpacing(20),

                  // Editable rating
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Icon(
                              index < selectedRating
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: index < selectedRating
                                  ? AppColors.mainBlue
                                  : AppColors.grey,
                              size: 40.sp,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  verticalSpacing(12),
                  Center(
                    child: Text(
                      HelperDialogs.getRatingText(selectedRating, context),
                      style: FontHelper.font15BlackW600(context).copyWith(
                        color: AppColors.mainBlue,
                      ),
                    ),
                  ),

                  verticalSpacing(24),

                  // Editable TextField
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.greyBlue.withAlpha(60),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: textEditingController,
                      maxLines: 4,
                      style: FontHelper.font10BlackW500(context).copyWith(
                        fontSize: 16.sp,
                        color: AppColors.darkGreyBlue,
                      ),
                      decoration: InputDecoration(
                        hintText: title,
                        hintStyle: FontHelper.font12lackW400(context).copyWith(
                          color: AppColors.darkGreyBlue.withAlpha(170),
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  verticalSpacing(24),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 24.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          S.of(context).cancel,
                          style: FontHelper.font16BlackW600(context).copyWith(
                            color: AppColors.darkGreyBlue,
                          ),
                        ),
                      ),
                      horizontalSpacing(8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onPressed(textEditingController.text, selectedRating);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainBlue,
                          foregroundColor: Colors.white,
                          elevation: 6,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 24.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.checkmark_alt,
                              size: 18.sp,
                            ),
                            horizontalSpacing(8),
                            Text(
                              buttonText,
                              style:
                                  FontHelper.font16BlackW600(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
