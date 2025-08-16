import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../student_features/signup/logic/cubit/signup_cubit.dart';
import '../theming/font_helper.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({super.key});

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CountryCodePicker(
      initialSelection: 'EG',
      showCountryOnly: true,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      showDropDownButton: true,

      // Enhanced dialog styling
      dialogSize: Size(double.infinity, 500.h),
      dialogBackgroundColor: isDark ? Colors.grey[900] : Colors.white,

      // Enhanced header styling
      headerTextStyle: FontHelper.font15BlackW600(context).copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: isDark ? Colors.white : Colors.black87,
      ),
      headerText: S.of(context).selectCountry,

      // Enhanced text styling
      textStyle: FontHelper.font14BlackW500(context).copyWith(
        letterSpacing: 0.3.w,
        fontSize: 15.sp,
        color: isDark ? Colors.white : Colors.black87,
      ),

      barrierColor: Colors.black54,
      flagWidth: 28.w,
      margin: EdgeInsets.zero,
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 6.w,
        top: 12.h,
        bottom: 12.h,
      ),

      // Enhanced dialog text styling
      dialogTextStyle: FontHelper.font14BlackW500(context).copyWith(
        color: isDark ? Colors.white : Colors.black87,
        fontSize: 15.sp,
      ),

      searchStyle: FontHelper.font15BlackW400(context).copyWith(
        color: isDark ? Colors.white : Colors.black87,
      ),

      // Enhanced search field styling
      searchDecoration: InputDecoration(
        hintText: S.of(context).selectCountry,
        hintStyle: FontHelper.font15BlackW400(context).copyWith(
          color: isDark ? Colors.grey[400] : Colors.black54,
        ),
        filled: true,
        fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
          size: 20.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.w,
          ),
        ),
      ),

      // Enhanced dialog item styling
      dialogItemPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),

      // Enhanced empty state
      emptySearchBuilder: (context) => Container(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.search,
              size: 48.sp,
              color: isDark ? Colors.grey[600] : Colors.grey[400],
            ),
            SizedBox(height: 16.h),
            Text(
              S.of(context).noCountryFound,
              style: FontHelper.font15BlackW400(context).copyWith(
                color: isDark ? Colors.grey[400] : Colors.black54,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Try a different search term',
              style: FontHelper.font15BlackW400(context).copyWith(
                color: isDark ? Colors.grey[500] : Colors.grey[600],
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      // Enhanced flag decoration
      flagDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),

      searchPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),

      closeIcon: Icon(
        CupertinoIcons.xmark,
        size: 18.sp,
        color: isDark ? Colors.white : Colors.black87,
      ),

      onChanged: (value) {
        // Add haptic feedback
        HapticFeedback.lightImpact();

        BlocProvider.of<SignupCubit>(context).selectedCountryCode =
            value.dialCode!;
        log(BlocProvider.of<SignupCubit>(context).selectedCountryCode);
      },
    );
  }
}
