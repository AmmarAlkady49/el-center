import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_service.dart';
import 'package:e_learning_app/core/networking/dio_factory.dart';
import 'package:e_learning_app/student_features/login/data/repo/login_repo.dart';
import 'package:e_learning_app/student_features/login/logic/cubit/login_cubit.dart';
import 'package:e_learning_app/student_features/signup/data/repo/signup_repo.dart';
import 'package:e_learning_app/student_features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../instructor_feature/home/data/repo/instructor_home_repo.dart';
import '../../instructor_feature/home/logic/cubit/home_instructor_cubit.dart';
import '../../student_features/authVerification/data/repo/active_account_repo.dart';
import '../../student_features/authVerification/logic/cubit/verification_account_cubit.dart';
import '../../student_features/course_details/data/repos/course_details_repo.dart';
import '../../student_features/course_details/logic/cubit/course_details_cubit.dart';
import '../../student_features/home/data/repo/home_repo.dart';
import '../../student_features/home/logic/cubit/home_cubit.dart';
import '../../student_features/learning_centre/data/repo/learning_centre_repo.dart';
import '../../student_features/learning_centre/logic/cubit/learning_centre_cubit.dart';
import '../../student_features/my_courses/data/repo/my_courses_repo.dart';
import '../../student_features/my_courses/logic/cubit/my_courses_cubit.dart';
import '../../student_features/payment/data/repo/payment_repo.dart';
import '../../student_features/payment/logic/cubit/payment_cubit.dart';
import '../../student_features/search/data/repo/search_repo.dart';
import '../../student_features/search/logic/cubit/search_cubit.dart';
import '../../student_features/settings/data/repo/settings_repo.dart';
import '../../student_features/settings/logic/cubit/settings_cubit.dart';
import '../data/repo/profile_repo.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio $ ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));

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
  getIt
      .registerLazySingleton<SearchRepo>(() => SearchRepo(apiService: getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  // home Instructor

  getIt.registerLazySingleton<InstructorHomeRepo>(
      () => InstructorHomeRepo(apiService: getIt()));
  getIt
      .registerFactory<HomeInstructorCubit>(() => HomeInstructorCubit(getIt()));
}
