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
import '../../features/home/logic/cubit/home_cubit.dart';
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
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
