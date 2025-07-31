import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/course_info_model.dart';
import '../../data/model/student_enrollments_model.dart';

part 'my_courses_state.freezed.dart';

@freezed
class MyCoursesState<T> with _$MyCoursesState<T> {
  const factory MyCoursesState.initial() = _Initial;

  const factory MyCoursesState.myCoursesLoading() = MyCoursesLoading;

  const factory MyCoursesState.myCoursesLoaded({
    required List<CourseInfoModel> studentEnrollments,
    required List<StudentEnrollmentsModel> studentEnrollmentsCoursesInfo,
  }) = MyCoursesLoaded;

  const factory MyCoursesState.myCoursesLoadedError({
    required String errorMessage,
  }) = MyCoursesLoadedError;
}
