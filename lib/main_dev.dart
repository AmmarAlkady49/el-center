import 'package:e_learning_app/core/di/dependency_injection.dart' as di;
import 'package:e_learning_app/core/helpers/app_constants.dart';
import 'package:e_learning_app/core/helpers/shared_pref_helper.dart';
import 'package:e_learning_app/el_center_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/networking/dio_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await di.setupGetIt();
  final fetchedLang = await SharedPrefHelper.getString("language_code");
  final userType = await SharedPrefHelper.getString("userType") ?? "Student";
  await checkShowOnboarding();
  final languageCode =
      (fetchedLang != null && fetchedLang.isNotEmpty) ? fetchedLang : 'en';

  final token = await SharedPrefHelper.getSecuredString("token");
  if (token != null && token.isNotEmpty) {
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
  // await checkIfUserIsLoggedIn();
  runApp(ElCenterApp(
    languageCode: languageCode,
    isStudent: userType == "Student",
    showOnboarding: showOnboarding,
  ));
}

Future<void> checkIfUserIsLoggedIn() async {
  final String? userToken = await SharedPrefHelper.getSecuredString("token");

  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

Future<void> checkShowOnboarding() async {
  final bool? hasSeenOnboarding =
      await SharedPrefHelper.getBool("hasSeenOnboarding");
  if (hasSeenOnboarding != null && hasSeenOnboarding) {
    showOnboarding = false;
  } else {
    showOnboarding = true;
  }
}
