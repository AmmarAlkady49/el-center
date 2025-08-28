import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/data/models/course_info_model.dart';
import '../../../../core/data/models/profile_account_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.homeScreenLoading() = HomeScreenLoading;
  const factory HomeState.homeScreenLoaded({
    required ProfileAccountModel profileData,
    required List<CourseInfoModel> courses,
    required Map<String, int> weeklyProgress,
  }) = HomeScreenLoaded;
  const factory HomeState.homeScreenLoadedError({required String error}) =
      HomeScreenLoadedError;
  const factory HomeState.gettingCourses() = GettingCourses;
  const factory HomeState.coursesLoaded(
      {required List<CourseInfoModel> courses}) = CoursesLoaded;
  const factory HomeState.coursesLoadedError({required String error}) =
      CoursesLoadedError;
  const factory HomeState.gettingCoursesByCategory() = GettingCoursesByCategory;
  const factory HomeState.coursesByCategoryLoaded(
      {required List<CourseInfoModel> courses}) = CoursesByCategoryLoaded;
  const factory HomeState.coursesByCategoryLoadedError(
      {required String error}) = CoursesByCategoryLoadedError;

  const factory HomeState.weeklyProgressLoaded(
      {required Map<String, int> data}) = WeeklyProgressLoaded;

  const factory HomeState.weeklyProgressError({required String error}) =
      WeeklyProgressError;

  const factory HomeState.gettingCategories() = GettingCategories;
  const factory HomeState.categoriesLoaded(
      {required List<CategoryModel> categories}) = CategoriesLoaded;
  const factory HomeState.categoriesLoadedError({required String error}) =
      CategoriesLoadedError;
}
