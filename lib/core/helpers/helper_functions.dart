import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/course_modules_with_lessons.dart';
import '../data/models/lesson_module.dart';

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

  
  static String formatDate2(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

   static String getTotalLessons(List<CourseModulesWithLessons> modulesWithLessons) {
    final total = modulesWithLessons.fold(
        0, (sum, module) => sum + module.lessons.length);
    return total.toString();
  }

  static String getTotalDuration(List<CourseModulesWithLessons> modulesWithLessons) {
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
}
