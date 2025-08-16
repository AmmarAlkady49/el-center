import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/course_info_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState<T> {
  const factory SearchState.initial() = Initial;

  const factory SearchState.courseSearching() = CourseSearching;

  const factory SearchState.courseSearched({
    required List<CourseInfoModel> courses,
  }) = CourseSearched;

  const factory SearchState.error({
    required String message,
  }) = Error;
}
