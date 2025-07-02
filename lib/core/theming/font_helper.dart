import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontHelper {
  static TextStyle font24Black45W300(BuildContext context) {
    return _localizedFont(context, FontWeight.w300).copyWith(
      fontSize: 24.sp,
      color: Colors.black45,
    );
  }

  static TextStyle font18Black45W300(BuildContext context) {
    return _localizedFont(context, FontWeight.w300).copyWith(
      fontSize: 18.sp,
      color: Colors.black45,
    );
  }

  static TextStyle font24BlackW700(BuildContext context) {
    return _localizedFont(context, FontWeight.w700).copyWith(
      fontSize: 24.sp,
      color: Colors.black,
    );
  }

  static TextStyle font20BlackW700(BuildContext context) {
    return _localizedFont(context, FontWeight.w700).copyWith(
      fontSize: 20.sp,
      color: Colors.black,
    );
  }

  static TextStyle font36WhiteW700(BuildContext context) {
    return _localizedFont(context, FontWeight.w700).copyWith(
      fontSize: 36.sp,
      color: Colors.white,
    );
  }

  static TextStyle font12lackW400(BuildContext context) {
    return _localizedFont(context, FontWeight.w400).copyWith(
      fontSize: 12.sp,
      color: Colors.black,
    );
  }
  static TextStyle font14BlackW500(BuildContext context) {
    return _localizedFont(context, FontWeight.w500).copyWith(
      fontSize: 14.sp,
      color: Colors.black,
    );
  }

  static TextStyle font15BlackW400(BuildContext context) {
    return _localizedFont(context, FontWeight.w400).copyWith(
      fontSize: 15.sp,
      color: Colors.black,
    );
  }

  static TextStyle font16WhiteW500(BuildContext context) {
    return _localizedFont(context, FontWeight.w500).copyWith(
      fontSize: 16.sp,
      color: Colors.white,
    );
  }

  static TextStyle font16WhiteW600(BuildContext context) {
    return _localizedFont(context, FontWeight.w600).copyWith(
      fontSize: 16.sp,
      color: Colors.white,
    );
  }

  static TextStyle font16BlackW500(BuildContext context) {
    return _localizedFont(context, FontWeight.w500).copyWith(
      fontSize: 16.sp,
      color: Colors.black,
    );
  }

  static TextStyle font16BlackW600(BuildContext context) {
    return _localizedFont(context, FontWeight.w600).copyWith(
      fontSize: 16.sp,
      color: Colors.black,
    );
  }

  static TextStyle _localizedFont(BuildContext context, FontWeight weight) {
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == 'ar') {
      return TextStyle(
        fontFamily: "Cairo",
        fontWeight: _adjustArabicWeight(weight),
      );
    } else {
      return TextStyle(
        fontFamily: "Poppins",
        fontWeight: weight,
      );
    }
  }

  static FontWeight _adjustArabicWeight(FontWeight weight) {
    switch (weight) {
      case FontWeight.w300:
        return FontWeight.w400;
      case FontWeight.w400:
        return FontWeight.w500;
      case FontWeight.w500:
        return FontWeight.w600;
      case FontWeight.w600:
      case FontWeight.w700:
        return FontWeight.w700;
      default:
        return weight;
    }
  }
}
