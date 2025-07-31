import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_service.dart';
import 'package:e_learning_app/core/networking/dio_factory.dart';
import 'package:e_learning_app/features/login/data/repo/login_repo.dart';
import 'package:e_learning_app/features/login/logic/cubit/login_cubit.dart';
import 'package:e_learning_app/features/signup/data/repo/signup_repo.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/authVerification/data/repo/active_account_repo.dart';
import '../../features/authVerification/logic/cubit/verification_account_cubit.dart';
import '../../features/course_details/data/repos/course_details_repo.dart';
import '../../features/course_details/logic/cubit/course_details_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/learning_centre/data/repo/learning_centre_repo.dart';
import '../../features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import '../../features/my_courses/data/repo/my_courses_repo.dart';
import '../../features/my_courses/logic/cubit/my_courses_cubit.dart';
import '../../features/payment/data/repo/payment_repo.dart';
import '../../features/payment/logic/cubit/payment_cubit.dart';
import '../../features/search/data/repo/search_repo.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/settings/data/repo/settings_repo.dart';
import '../../features/settings/logic/cubit/settings_cubit.dart';
import '../data/repo/profile_repo.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio $ ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // active account
  getIt.registerLazySingleton<ActiveAccountRepo>(
      () => ActiveAccountRepo(getIt()));
  getIt.registerFactory<VerificationAccountCubit>(
      () => VerificationAccountCubit(getIt()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  // getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt()));

  // course details
  getIt.registerLazySingleton<CourseDetailsRepo>(
      () => CourseDetailsRepo(getIt()));
  getIt.registerFactory<CourseDetailsCubit>(() => CourseDetailsCubit(
        getIt(),
        getIt(),
      ));

  // payment
  getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt()));

  // learning lessons El Centre
  getIt.registerLazySingleton<LearningCentreRepo>(
      () => LearningCentreRepo(getIt()));
  getIt
      .registerFactory<LearningCentreCubit>(() => LearningCentreCubit(getIt()));

  // my courses
  getIt.registerLazySingleton<MyCoursesRepo>(() => MyCoursesRepo(getIt()));
  getIt.registerFactory<MyCoursesCubit>(
      () => MyCoursesCubit(myCoursesRepo: getIt()));

  // settings page
  getIt.registerLazySingleton<SettingsRepo>(
      () => SettingsRepo(apiService: getIt()));
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt()));

  // search page
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(apiService:  getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
}
