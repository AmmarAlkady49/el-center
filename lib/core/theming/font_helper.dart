import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontHelper {
  static TextStyle font24thinWeight300(BuildContext context) {
    return _localizedFont(context).copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w300,
      // color: AppColors.grey,
      color: Colors.black45,
    );
  }

  static TextStyle font16thinWeight300(BuildContext context) {
    return _localizedFont(context).copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black45,
    );
  }

  static TextStyle font24thinWeight700(BuildContext context) {
    return _localizedFont(context).copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      // color: AppColors.darkBlue,
      color: Colors.black,
    );
  }

  static TextStyle font20thinWeight700(BuildContext context) {
    return _localizedFont(context).copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      // color: AppColors.darkBlue,
      color: Colors.black,
    );
  }

  // Helper method to choose font based on locale
  static TextStyle _localizedFont(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == 'ar') {
      return GoogleFonts.cairo(); // or Tajawal if you prefer
    } else {
      return GoogleFonts.poppins();
    }
  }
}
