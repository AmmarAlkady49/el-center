import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_learning_app/generated/l10n.dart';

import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../theming/font_helper.dart';

class CountryCodePickerWidget extends StatelessWidget {
  const CountryCodePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      initialSelection: 'EG',
      showCountryOnly: true,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      showDropDownButton: true,
      dialogSize: Size(double.infinity, 500.h),
      headerTextStyle: FontHelper.font15BlackW600(context),
      headerText: S.of(context).selectCountry,
      textStyle:
          FontHelper.font14BlackW500(context).copyWith(letterSpacing: 0.5),
      barrierColor: Colors.black26,
      flagWidth: 25.w,
      margin: EdgeInsets.zero,
      padding: EdgeInsetsDirectional.only(start: 8.w),
      dialogTextStyle: FontHelper.font14BlackW500(context),
      searchStyle: FontHelper.font15BlackW400(context),
      searchDecoration: InputDecoration(
          hintText: S.of(context).selectCountry,
          hintStyle: FontHelper.font15BlackW400(context).copyWith(
            color: Colors.black54,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
      dialogItemPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      emptySearchBuilder: (context) => Padding(
        padding: EdgeInsets.only(top: 18.h),
        child: Center(
          child: Text(
            S.of(context).noCountryFound,
            style: FontHelper.font15BlackW400(context).copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
      flagDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.r,
          ),
        ],
      ),
      closeIcon: Icon(CupertinoIcons.xmark),
      onChanged: (value) {
        BlocProvider.of<SignupCubit>(context).selectedCountryCode =
            value.dialCode!;
        log(BlocProvider.of<SignupCubit>(context).selectedCountryCode);
      },
    );
  }
}
