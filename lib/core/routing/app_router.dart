import 'package:e_learning_app/core/di/dependency_injection.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_page.dart';
import 'package:e_learning_app/features/login/logic/cubit/login_cubit.dart';
import 'package:e_learning_app/features/login/presentation/screens/login_page.dart';
import 'package:e_learning_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginPage(),
                ));
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
