import 'package:e_learning_app/core/routing/app_router.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElCenterApp extends StatelessWidget {
  const ElCenterApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFFCFCFC), // AppColors.mainBlue
        ),
        initialRoute: AppRoutes.onBoardingScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
