import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/networking/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/course_modules_with_lessons.dart';
import '../data/models/lesson_module.dart';
import '../theming/app_colors.dart';
import '../theming/font_helper.dart';

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

  static Widget buildModernStatBadge({
    required IconData icon,
    required BuildContext context,
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

  static Widget buildModernMetadataChip({
    required IconData icon,
    required String text,
    required Color color,
    required BuildContext context,
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
}
