import 'dart:developer';

import 'package:e_learning_app/core/data/models/category_model.dart';
import 'package:e_learning_app/core/data/repo/profile_repo.dart';
import 'package:e_learning_app/core/helpers/shared_pref_helper.dart';
import 'package:e_learning_app/student_features/home/data/repo/home_repo.dart';
import 'package:e_learning_app/student_features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_learning_app/core/networking/api_result.dart' as api_result;

import '../../../../core/data/models/course_info_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepo profileRepo;
  final HomeRepo homeRepo;
  HomeCubit(this.profileRepo, this.homeRepo) : super(HomeState.initial());

  void emitHomeScreenForStudent() async {
    emit(HomeState.homeScreenLoading());
    try {
      final userProfile = await profileRepo.getProfile();
      await SharedPrefHelper.setData('userId', userProfile.id);

      final getAllCoursesForStudents = await homeRepo.getAllCourses();
      final weeklyProgressData = await weeklyProgress();

      emit(HomeState.homeScreenLoaded(
          profileData: userProfile,
          courses: getAllCoursesForStudents.data,
          weeklyProgress: weeklyProgressData));
    } catch (error) {
      log(error.toString());
      emit(HomeState.homeScreenLoadedError(error: error.toString()));
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

  Future<Map<String, int>> weeklyProgress() async {
    try {
      final enrollments = await homeRepo.getStudentEnrollments();

      // هجيب الدروس المكملة لكل كورس
      final completedLessonsLists = await Future.wait(
        enrollments
            .map((course) => homeRepo.getCompletedLessons(course.courseId)),
      );

      log("completedLessonsLists: ${completedLessonsLists.length}");

      final now = DateTime.now();
      final weekAgo = now.subtract(const Duration(days: 6));

      final Map<String, int> completedLessonsPerDay = {
        'Mon': 0,
        'Tue': 0,
        'Wed': 0,
        'Thu': 0,
        'Fri': 0,
        'Sat': 0,
        'Sun': 0,
      };

      for (final lessons in completedLessonsLists) {
        for (final lesson in lessons) {
          final completedDate = DateTime.parse(lesson.completedDate);

          if (completedDate.isAfter(weekAgo)) {
            final weekday = _getWeekday(completedDate.weekday);
            completedLessonsPerDay[weekday] =
                completedLessonsPerDay[weekday]! + 1;
          }
        }
      }

      return completedLessonsPerDay;
    } catch (error) {
      throw Exception("Failed to fetch weekly progress: $error");
    }
  }

  String _getWeekday(int weekdayNum) {
    const weekdays = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };
    return weekdays[weekdayNum] ?? '';
  }

  // getAllCategories
  void getAllCategories() async {
    emit(HomeState.gettingCategories());
    try {
      final result = await homeRepo.getAllCategories();

      if (result is api_result.Success<List<CategoryModel>>) {
        emit(HomeState.categoriesLoaded(categories: result.data));
      } else if (result is api_result.Failure<List<CategoryModel>>) {
        emit(HomeState.categoriesLoadedError(
          error:
              "${result.error.apiErrorModel.message!} (Status Code: ${result.error.apiErrorModel.statusCode})",
        ));
      }
    } catch (error) {
      log(error.toString());
      emit(HomeState.categoriesLoadedError(error: error.toString()));
    }
  }
}
