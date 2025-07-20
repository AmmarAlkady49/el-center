import 'package:e_learning_app/core/di/dependency_injection.dart' as di;
import 'package:e_learning_app/el_center_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/app_constants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/networking/dio_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await di.setupGetIt();

  final token = await SharedPrefHelper.getSecuredString("token");
  if (token != null && token.isNotEmpty) {
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
  // await checkIfUserIsLoggedIn();
  runApp(const ElCenterApp());
}

Future<void> checkIfUserIsLoggedIn() async {
  final String? userToken = await SharedPrefHelper.getSecuredString("token");

  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
