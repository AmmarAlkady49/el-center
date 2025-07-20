import 'dart:developer';

import 'package:e_learning_app/core/data/repo/profile_repo.dart';
import 'package:e_learning_app/features/home/data/repo/home_repo.dart';
import 'package:e_learning_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_learning_app/core/networking/api_result.dart' as api_result;

import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/profile_account_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepo profileRepo;
  final HomeRepo homeRepo;
  HomeCubit(this.profileRepo, this.homeRepo) : super(HomeState.initial());

  // getAppBarData
  void getAppBarData() async {
    emit(HomeState.homeScreenLoading());
    try {
      final result = await profileRepo.getProfile();
      log(result.toString());

      if (result is api_result.Success<ProfileAccountModel>) {
        emit(HomeState.homeScreenLoaded(profileData: result.data));
      } else if (result is api_result.Failure<ProfileAccountModel>) {
        emit(HomeState.homeScreenLoadedError(
            error: result.error.apiErrorModel.message!));
      }
    } catch (error) {
      log(error.toString());
      emit(HomeState.homeScreenLoadedError(error: error.toString()));
    }
  }

  // getAllCourses
  void getAllCourses() async {
    emit(HomeState.gettingCourses());
    try {
      final result = await homeRepo.getAllCourses();

      if (result is api_result.Success<List<CourseInfoModel>>) {
        emit(HomeState.coursesLoaded(courses: result.data));
      } else if (result is api_result.Failure<List<CourseInfoModel>>) {
        emit(HomeState.coursesLoadedError(
          error:
              "${result.error.apiErrorModel.message!} (Status Code: ${result.error.apiErrorModel.statusCode}) ${result.error.apiErrorModel.message}",
        ));
      }
    } catch (error) {
      log(error.toString());
      emit(HomeState.coursesLoadedError(error: error.toString()));
    }
  }

  // getCoursesByCategory
  void getCoursesByCategory(int category) async {
    emit(HomeState.gettingCoursesByCategory());
    try {
      final result = category == 0
          ? await homeRepo.getAllCourses()
          : await homeRepo.getCoursesByCategory(category);

      if (result is api_result.Success<List<CourseInfoModel>>) {
        emit(HomeState.coursesByCategoryLoaded(courses: result.data));
      } else if (result is api_result.Failure<List<CourseInfoModel>>) {
        emit(HomeState.coursesByCategoryLoadedError(
          error:
              "${result.error.apiErrorModel.message!} (Status Code: ${result.error.apiErrorModel.statusCode}) ${result.error.apiErrorModel.message}",
        ));
      }
    } catch (error) {
      log(error.toString());
      emit(HomeState.coursesByCategoryLoadedError(error: error.toString()));
    }
  }
}
