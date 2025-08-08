import 'package:e_learning_app/core/di/dependency_injection.dart';
import 'package:e_learning_app/core/routing/app_routes.dart';
import 'package:e_learning_app/features/authVerification/presentation/screens/verify_account.dart';
import 'package:e_learning_app/features/course_details/logic/cubit/course_details_cubit.dart';
import 'package:e_learning_app/features/course_details/presentation/screens/write_review_page.dart';
import 'package:e_learning_app/features/home/logic/cubit/home_cubit.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_page.dart';
import 'package:e_learning_app/features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import 'package:e_learning_app/features/login/logic/cubit/login_cubit.dart';
import 'package:e_learning_app/features/login/presentation/screens/login_page.dart';
import 'package:e_learning_app/features/main_bottom_nav_bar.dart';
import 'package:e_learning_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:e_learning_app/features/settings/logic/cubit/settings_cubit.dart';
import 'package:e_learning_app/features/settings/presentation/screens/change_language_screen.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:e_learning_app/features/signup/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authVerification/logic/cubit/verification_account_cubit.dart';
import '../../features/course_details/presentation/screens/course_details_page.dart';
import '../../features/course_details/presentation/screens/free_article_reading_page_preview.dart';
import '../../features/course_details/presentation/screens/preview_lesson_page.dart';
import '../../features/home/presentation/screens/all_categories_page.dart';
import '../../features/home/presentation/screens/courses_by_category.dart';
import '../../features/learning_centre/data/model/quiz_model.dart';
import '../../features/learning_centre/presentation/screens/ai_chat_bot_page.dart';
import '../../features/learning_centre/presentation/screens/article_reading_page.dart';
import '../../features/learning_centre/presentation/screens/lesson_player_page.dart';
import '../../features/learning_centre/presentation/screens/lesson_quiz_page.dart';
import '../../features/settings/presentation/screens/personal_info_screen.dart';
import '../data/models/course_info_model.dart';
import '../data/models/course_module_model.dart';
import '../data/models/course_modules_with_lessons.dart';
import '../data/models/course_review_model.dart';
import '../data/models/lesson_module.dart';
import '../data/models/profile_account_model.dart';

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
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupPage(),
                ));
      case AppRoutes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<VerificationAccountCubit>(),
                  child: VerifyAccount(email: email),
                ));
      case AppRoutes.bottomNavigation:
        return MaterialPageRoute(builder: (_) => const MainBottomNavBar());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                  child: const HomePage(),
                ));
      case AppRoutes.coursesByCategory:
        final category = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<HomeCubit>()..getCoursesByCategory(category),
            child: CoursesByCategory(categoryId: category),
          ),
        );
      case AppRoutes.courseDetails:
        final courseBasicInfo = settings.arguments as CourseInfoModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<CourseDetailsCubit>()
                    ..getCourseDetails(courseBasicInfo.id, courseBasicInfo),
                  child: CourseDetailsPage(courseBasicInfo: courseBasicInfo),
                ));

      case AppRoutes.writeReview:
        final args = settings.arguments as Map<String, dynamic>;
        final courseBasicInfo = args['courseBasicInfo'] as CourseInfoModel;
        final courseDetailsCubit =
            args['courseDetailsCubit'] as CourseDetailsCubit;

        return MaterialPageRoute(
          builder: (context) => WriteReviewPage(
              courseBasicInfo: courseBasicInfo,
              courseDetailsCubit: courseDetailsCubit),
        );
      case AppRoutes.lessonPlayer:
        final args = settings.arguments as Map<String, dynamic>;
        final courseInfo = args['courseInfo'] as CourseInfoModel;
        final courseModules = args['courseModules'] as List<CourseModuleModel>;
        final lessons = args['lessons'] as List<LessonModule>;
        final courseReview = args['courseReview'] as List<CourseReviewModel>;
        final modulesWithLessons =
            args['modulesWithLessons'] as List<CourseModulesWithLessons>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LearningCentreCubit>(),
            child: LessonPlayerPage(
              courseInfo: courseInfo,
              courseModules: courseModules,
              lessons: lessons,
              modulesWithLessons: modulesWithLessons,
              courseReview: courseReview,
            ),
          ),
        );

      case AppRoutes.lessonQuiz:
        final quizzes = settings.arguments as List<QuizModel>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LearningCentreCubit>(),
            child: LessonQuizPage(quizzes: quizzes),
          ),
        );

      case AppRoutes.personalInformation:
        // final profileInfo = settings.arguments as ProfileAccountModel;
        final args = settings.arguments as Map<String, dynamic>;
        final profileInfo = args['profileInfo'] as ProfileAccountModel;
        final cubit = args['cubit'] as SettingsCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SettingsCubit>(),
            child: PersonalInfoScreen(profileInfo: profileInfo, cubit: cubit),
          ),
        );

      case AppRoutes.changeLanguage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: getIt<SettingsCubit>(),
                  child: const ChangeLanguageScreen(),
                ));

      case AppRoutes.getAllCategories:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getAllCategories(),
            child: const AllCategoriesPage(),
          ),
        );

      case AppRoutes.articleReading:
        final args = settings.arguments as Map<String, dynamic>;
        final article = args['lesson'] as LessonModule;
        final cubit = args['cubit'] as LearningCentreCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LearningCentreCubit>(),
            child: ArticleReadingPage(lesson: article, cubit: cubit),
          ),
        );

      case AppRoutes.freeArticleReadingPreview:
        final args = settings.arguments as Map<String, dynamic>;
        final article = args['lesson'] as LessonModule;
        final cubit = args['cubit'] as CourseDetailsCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CourseDetailsCubit>(),
            child: FreeArticleReadingPagePreview(lesson: article, cubit: cubit),
          ),
        );

      case AppRoutes.aiChatBot:
        final cubit = settings.arguments as LearningCentreCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LearningCentreCubit>(),
            child: AiChatBotPage(cubit: cubit),
          ),
        );

      case AppRoutes.previewLesson:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as CourseDetailsCubit;
        final lesson = args['lesson'] as LessonModule;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CourseDetailsCubit>(),
            child: PreviewLessonPage(cubit: cubit, lesson: lesson),
          ),
        );

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
