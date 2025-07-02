import 'package:e_learning_app/core/routing/app_router.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

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
        locale: Locale("ar"),
        // locale: locator<Locale>(),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: AppColors.backgroundWiteColor,
        ),
        initialRoute: AppRoutes.onBoardingScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
