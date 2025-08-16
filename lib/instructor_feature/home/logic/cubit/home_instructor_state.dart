import 'package:e_learning_app/instructor_feature/home/data/model/course_info_model_with_student_count_and_completion_rate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/profile_account_model.dart';

part 'home_instructor_state.freezed.dart';

@freezed
class HomeInstructorState<T> with _$HomeInstructorState<T> {
  const factory HomeInstructorState.initial() = _Initial;

  const factory HomeInstructorState.homeIstructorLoading() =
      HomeIstructorLoading;

  const factory HomeInstructorState.homeIstructorSuccess({
    required ProfileAccountModel profileDate,
    required int totalStudents,
    required int totalCourses,
    required double avgRating,
    required double avgCompletionRate,
    required List<CourseInfoModelWithStudentCountAndCompletionRateModel>
        courseInfoModelWithStudentCountAndCompletionRateModel,
  }) = HomeIstructorSuccess;

  const factory HomeInstructorState.homeIstructorError(
      {required String error}) = HomeIstructorError;

  const factory HomeInstructorState.togglePublished(bool isPublished) =
      TogglePublished;

  const factory HomeInstructorState.toggleAIAssistant(
      bool isAIAssistantEnabled) = ToggleAIAssistant;

  const factory HomeInstructorState.selectCategory(String category) =
      SelectCategory;

  const factory HomeInstructorState.selectLanguage(String language) =
      SelectLanguage;

  const factory HomeInstructorState.addCourse() = AddCourse;

  const factory HomeInstructorState.addCourseSuccess({required String message}) = AddCourseSuccess;

  const factory HomeInstructorState.addCourseError({required String error}) =
      AddCourseError;

  const factory HomeInstructorState.updateCourse() = UpdateCourse;

  const factory HomeInstructorState.updateCourseSuccess({required String message}) = UpdateCourseSuccess;

  const factory HomeInstructorState.updateCourseError({required String error}) =
      UpdateCourseError;
}
