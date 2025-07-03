import 'package:dio/dio.dart';
import 'package:e_learning_app/core/networking/api_service.dart';
import 'package:e_learning_app/core/networking/dio_factory.dart';
import 'package:e_learning_app/features/login/data/repo/login_repo.dart';
import 'package:e_learning_app/features/login/logic/cubit/login_cubit.dart';
import 'package:e_learning_app/features/signup/data/repo/signup_repo.dart';
import 'package:e_learning_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio $ ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));
}
