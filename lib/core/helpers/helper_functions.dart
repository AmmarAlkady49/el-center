import 'package:e_learning_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
}
