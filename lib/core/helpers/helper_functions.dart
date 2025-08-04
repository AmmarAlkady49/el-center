import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/helpers/spacing.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../data/models/course_modules_with_lessons.dart';
import '../data/models/lesson_module.dart';
import '../theming/app_colors.dart';

class HelperFunctions {
  /// Calculates the width of a word with a given [TextStyle].
  static double getWordWidth(String word, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: word, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width + 60;
  }

  // show scafoldSnakBar

  // Success SnackBar
  static void showSuccess(String message, BuildContext context) {
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
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      duration: const Duration(seconds: 3),
      elevation: 6,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Error SnackBar
  static void showError(String message, BuildContext context) {
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
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      // margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
      elevation: 6,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Helper method to format duration
  static String formatDuration(int? minutes) {
    if (minutes == null || minutes == 0) return '';

    if (minutes < 60) {
      return '${minutes}min';
    } else {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      return remainingMinutes > 0
          ? '${hours}h ${remainingMinutes}min'
          : '${hours}h';
    }
  }

  // Helper method to format date
  static String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 30) {
        return '${date.day}/${date.month}/${date.year}';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minutes ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return dateString;
    }
  }

  static String formatTimeAgo3(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }

  static String formatDate2(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String getTotalLessons(
      List<CourseModulesWithLessons> modulesWithLessons) {
    final total = modulesWithLessons.fold(
        0, (sum, module) => sum + module.lessons.length);
    return total.toString();
  }

  static String getTotalDuration(
      List<CourseModulesWithLessons> modulesWithLessons) {
    final total = modulesWithLessons.fold(
        0,
        (sum, module) =>
            sum +
            module.lessons.fold(0,
                (lessonSum, lesson) => lessonSum + lesson.durationInMinutes!));
    return "${total.toString()} min";
  }

  static String calculateSectionDuration(List<LessonModule> lessons) {
    final total =
        lessons.fold(0, (sum, module) => sum + module.durationInMinutes!);
    return "${total}min";
  }

  static String getLessonDuration(LessonModule lesson) {
    return "${lesson.durationInMinutes.toString()} min";
  }

  static IconData getContentTypeIcon(String? contentType) {
    switch (contentType?.toLowerCase()) {
      case 'video':
        return Icons.play_arrow_outlined;
      case 'audio':
        return Icons.headphones;
      case 'text':
        return Icons.article_outlined;
      default:
        return Icons.play_circle_outline;
    }
  }

  // instructor image
  static Widget getInstructorImage(String? imageUrl, double? radius) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.grey.shade300,
        child: const Icon(Icons.person, color: Colors.white),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.mainBlue.withAlpha(175),
            width: 3,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: "${ApiConstants.apiBaseUrl}$imageUrl",
            width: radius ?? 35.w,
            height: radius ?? 35.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: radius ?? 35.w,
              height: radius ?? 35.h,
              color: Colors.grey.shade200,
            ),
            errorWidget: (context, url, error) => Container(
              width: radius ?? 35.w,
              height: radius ?? 35.h,
              color: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                size: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }
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

  static Widget showUserImage(
      String? imageUrl, double? radius, double? size, double? borderWidth) {
    return
        // Main avatar
        Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainBlue,
        border: Border.all(
          color: Colors.white,
          width: borderWidth ?? 4.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: imageUrl == null
            ? Icon(
                Icons.person,
                size: radius! - 15.sp,
                color: Colors.white,
              )
            : CachedNetworkImage(
                imageUrl: "${ApiConstants.baseUrlOfTheImage}/$imageUrl",
                fit: BoxFit.cover,
                placeholder: (context, url) => Icon(
                  Icons.person,
                  size: radius,
                  color: Colors.white,
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  size: radius! - 15.sp,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  static String getWeekday(int weekdayNum) {
    const weekdays = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };
    return weekdays[weekdayNum] ?? '';
  }

  static Widget showReportOrDeleteDialog(
      {required BuildContext context,
      required void Function()? onPressed,
      required String title,
      required String message}) {
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
            Text(
              title,
                
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
                    S.of(context).report,
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
}
