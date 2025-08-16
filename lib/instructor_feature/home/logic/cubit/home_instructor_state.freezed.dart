// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_instructor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeInstructorState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeInstructorState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeInstructorState<$T>()';
  }
}

/// @nodoc
class $HomeInstructorStateCopyWith<T, $Res> {
  $HomeInstructorStateCopyWith(
      HomeInstructorState<T> _, $Res Function(HomeInstructorState<T>) __);
}

/// Adds pattern-matching-related methods to [HomeInstructorState].
extension HomeInstructorStatePatterns<T> on HomeInstructorState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(HomeIstructorLoading<T> value)? homeIstructorLoading,
    TResult Function(HomeIstructorSuccess<T> value)? homeIstructorSuccess,
    TResult Function(HomeIstructorError<T> value)? homeIstructorError,
    TResult Function(TogglePublished<T> value)? togglePublished,
    TResult Function(ToggleAIAssistant<T> value)? toggleAIAssistant,
    TResult Function(SelectCategory<T> value)? selectCategory,
    TResult Function(SelectLanguage<T> value)? selectLanguage,
    TResult Function(AddCourse<T> value)? addCourse,
    TResult Function(AddCourseSuccess<T> value)? addCourseSuccess,
    TResult Function(AddCourseError<T> value)? addCourseError,
    TResult Function(UpdateCourse<T> value)? updateCourse,
    TResult Function(UpdateCourseSuccess<T> value)? updateCourseSuccess,
    TResult Function(UpdateCourseError<T> value)? updateCourseError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeIstructorLoading() when homeIstructorLoading != null:
        return homeIstructorLoading(_that);
      case HomeIstructorSuccess() when homeIstructorSuccess != null:
        return homeIstructorSuccess(_that);
      case HomeIstructorError() when homeIstructorError != null:
        return homeIstructorError(_that);
      case TogglePublished() when togglePublished != null:
        return togglePublished(_that);
      case ToggleAIAssistant() when toggleAIAssistant != null:
        return toggleAIAssistant(_that);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case SelectLanguage() when selectLanguage != null:
        return selectLanguage(_that);
      case AddCourse() when addCourse != null:
        return addCourse(_that);
      case AddCourseSuccess() when addCourseSuccess != null:
        return addCourseSuccess(_that);
      case AddCourseError() when addCourseError != null:
        return addCourseError(_that);
      case UpdateCourse() when updateCourse != null:
        return updateCourse(_that);
      case UpdateCourseSuccess() when updateCourseSuccess != null:
        return updateCourseSuccess(_that);
      case UpdateCourseError() when updateCourseError != null:
        return updateCourseError(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(HomeIstructorLoading<T> value)
        homeIstructorLoading,
    required TResult Function(HomeIstructorSuccess<T> value)
        homeIstructorSuccess,
    required TResult Function(HomeIstructorError<T> value) homeIstructorError,
    required TResult Function(TogglePublished<T> value) togglePublished,
    required TResult Function(ToggleAIAssistant<T> value) toggleAIAssistant,
    required TResult Function(SelectCategory<T> value) selectCategory,
    required TResult Function(SelectLanguage<T> value) selectLanguage,
    required TResult Function(AddCourse<T> value) addCourse,
    required TResult Function(AddCourseSuccess<T> value) addCourseSuccess,
    required TResult Function(AddCourseError<T> value) addCourseError,
    required TResult Function(UpdateCourse<T> value) updateCourse,
    required TResult Function(UpdateCourseSuccess<T> value) updateCourseSuccess,
    required TResult Function(UpdateCourseError<T> value) updateCourseError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case HomeIstructorLoading():
        return homeIstructorLoading(_that);
      case HomeIstructorSuccess():
        return homeIstructorSuccess(_that);
      case HomeIstructorError():
        return homeIstructorError(_that);
      case TogglePublished():
        return togglePublished(_that);
      case ToggleAIAssistant():
        return toggleAIAssistant(_that);
      case SelectCategory():
        return selectCategory(_that);
      case SelectLanguage():
        return selectLanguage(_that);
      case AddCourse():
        return addCourse(_that);
      case AddCourseSuccess():
        return addCourseSuccess(_that);
      case AddCourseError():
        return addCourseError(_that);
      case UpdateCourse():
        return updateCourse(_that);
      case UpdateCourseSuccess():
        return updateCourseSuccess(_that);
      case UpdateCourseError():
        return updateCourseError(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(HomeIstructorLoading<T> value)? homeIstructorLoading,
    TResult? Function(HomeIstructorSuccess<T> value)? homeIstructorSuccess,
    TResult? Function(HomeIstructorError<T> value)? homeIstructorError,
    TResult? Function(TogglePublished<T> value)? togglePublished,
    TResult? Function(ToggleAIAssistant<T> value)? toggleAIAssistant,
    TResult? Function(SelectCategory<T> value)? selectCategory,
    TResult? Function(SelectLanguage<T> value)? selectLanguage,
    TResult? Function(AddCourse<T> value)? addCourse,
    TResult? Function(AddCourseSuccess<T> value)? addCourseSuccess,
    TResult? Function(AddCourseError<T> value)? addCourseError,
    TResult? Function(UpdateCourse<T> value)? updateCourse,
    TResult? Function(UpdateCourseSuccess<T> value)? updateCourseSuccess,
    TResult? Function(UpdateCourseError<T> value)? updateCourseError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeIstructorLoading() when homeIstructorLoading != null:
        return homeIstructorLoading(_that);
      case HomeIstructorSuccess() when homeIstructorSuccess != null:
        return homeIstructorSuccess(_that);
      case HomeIstructorError() when homeIstructorError != null:
        return homeIstructorError(_that);
      case TogglePublished() when togglePublished != null:
        return togglePublished(_that);
      case ToggleAIAssistant() when toggleAIAssistant != null:
        return toggleAIAssistant(_that);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that);
      case SelectLanguage() when selectLanguage != null:
        return selectLanguage(_that);
      case AddCourse() when addCourse != null:
        return addCourse(_that);
      case AddCourseSuccess() when addCourseSuccess != null:
        return addCourseSuccess(_that);
      case AddCourseError() when addCourseError != null:
        return addCourseError(_that);
      case UpdateCourse() when updateCourse != null:
        return updateCourse(_that);
      case UpdateCourseSuccess() when updateCourseSuccess != null:
        return updateCourseSuccess(_that);
      case UpdateCourseError() when updateCourseError != null:
        return updateCourseError(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? homeIstructorLoading,
    TResult Function(
            ProfileAccountModel profileDate,
            int totalStudents,
            int totalCourses,
            double avgRating,
            double avgCompletionRate,
            List<CourseInfoModelWithStudentCountAndCompletionRateModel>
                courseInfoModelWithStudentCountAndCompletionRateModel)?
        homeIstructorSuccess,
    TResult Function(String error)? homeIstructorError,
    TResult Function(bool isPublished)? togglePublished,
    TResult Function(bool isAIAssistantEnabled)? toggleAIAssistant,
    TResult Function(String category)? selectCategory,
    TResult Function(String language)? selectLanguage,
    TResult Function()? addCourse,
    TResult Function(String message)? addCourseSuccess,
    TResult Function(String error)? addCourseError,
    TResult Function()? updateCourse,
    TResult Function(String message)? updateCourseSuccess,
    TResult Function(String error)? updateCourseError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeIstructorLoading() when homeIstructorLoading != null:
        return homeIstructorLoading();
      case HomeIstructorSuccess() when homeIstructorSuccess != null:
        return homeIstructorSuccess(
            _that.profileDate,
            _that.totalStudents,
            _that.totalCourses,
            _that.avgRating,
            _that.avgCompletionRate,
            _that.courseInfoModelWithStudentCountAndCompletionRateModel);
      case HomeIstructorError() when homeIstructorError != null:
        return homeIstructorError(_that.error);
      case TogglePublished() when togglePublished != null:
        return togglePublished(_that.isPublished);
      case ToggleAIAssistant() when toggleAIAssistant != null:
        return toggleAIAssistant(_that.isAIAssistantEnabled);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case SelectLanguage() when selectLanguage != null:
        return selectLanguage(_that.language);
      case AddCourse() when addCourse != null:
        return addCourse();
      case AddCourseSuccess() when addCourseSuccess != null:
        return addCourseSuccess(_that.message);
      case AddCourseError() when addCourseError != null:
        return addCourseError(_that.error);
      case UpdateCourse() when updateCourse != null:
        return updateCourse();
      case UpdateCourseSuccess() when updateCourseSuccess != null:
        return updateCourseSuccess(_that.message);
      case UpdateCourseError() when updateCourseError != null:
        return updateCourseError(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() homeIstructorLoading,
    required TResult Function(
            ProfileAccountModel profileDate,
            int totalStudents,
            int totalCourses,
            double avgRating,
            double avgCompletionRate,
            List<CourseInfoModelWithStudentCountAndCompletionRateModel>
                courseInfoModelWithStudentCountAndCompletionRateModel)
        homeIstructorSuccess,
    required TResult Function(String error) homeIstructorError,
    required TResult Function(bool isPublished) togglePublished,
    required TResult Function(bool isAIAssistantEnabled) toggleAIAssistant,
    required TResult Function(String category) selectCategory,
    required TResult Function(String language) selectLanguage,
    required TResult Function() addCourse,
    required TResult Function(String message) addCourseSuccess,
    required TResult Function(String error) addCourseError,
    required TResult Function() updateCourse,
    required TResult Function(String message) updateCourseSuccess,
    required TResult Function(String error) updateCourseError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case HomeIstructorLoading():
        return homeIstructorLoading();
      case HomeIstructorSuccess():
        return homeIstructorSuccess(
            _that.profileDate,
            _that.totalStudents,
            _that.totalCourses,
            _that.avgRating,
            _that.avgCompletionRate,
            _that.courseInfoModelWithStudentCountAndCompletionRateModel);
      case HomeIstructorError():
        return homeIstructorError(_that.error);
      case TogglePublished():
        return togglePublished(_that.isPublished);
      case ToggleAIAssistant():
        return toggleAIAssistant(_that.isAIAssistantEnabled);
      case SelectCategory():
        return selectCategory(_that.category);
      case SelectLanguage():
        return selectLanguage(_that.language);
      case AddCourse():
        return addCourse();
      case AddCourseSuccess():
        return addCourseSuccess(_that.message);
      case AddCourseError():
        return addCourseError(_that.error);
      case UpdateCourse():
        return updateCourse();
      case UpdateCourseSuccess():
        return updateCourseSuccess(_that.message);
      case UpdateCourseError():
        return updateCourseError(_that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? homeIstructorLoading,
    TResult? Function(
            ProfileAccountModel profileDate,
            int totalStudents,
            int totalCourses,
            double avgRating,
            double avgCompletionRate,
            List<CourseInfoModelWithStudentCountAndCompletionRateModel>
                courseInfoModelWithStudentCountAndCompletionRateModel)?
        homeIstructorSuccess,
    TResult? Function(String error)? homeIstructorError,
    TResult? Function(bool isPublished)? togglePublished,
    TResult? Function(bool isAIAssistantEnabled)? toggleAIAssistant,
    TResult? Function(String category)? selectCategory,
    TResult? Function(String language)? selectLanguage,
    TResult? Function()? addCourse,
    TResult? Function(String message)? addCourseSuccess,
    TResult? Function(String error)? addCourseError,
    TResult? Function()? updateCourse,
    TResult? Function(String message)? updateCourseSuccess,
    TResult? Function(String error)? updateCourseError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeIstructorLoading() when homeIstructorLoading != null:
        return homeIstructorLoading();
      case HomeIstructorSuccess() when homeIstructorSuccess != null:
        return homeIstructorSuccess(
            _that.profileDate,
            _that.totalStudents,
            _that.totalCourses,
            _that.avgRating,
            _that.avgCompletionRate,
            _that.courseInfoModelWithStudentCountAndCompletionRateModel);
      case HomeIstructorError() when homeIstructorError != null:
        return homeIstructorError(_that.error);
      case TogglePublished() when togglePublished != null:
        return togglePublished(_that.isPublished);
      case ToggleAIAssistant() when toggleAIAssistant != null:
        return toggleAIAssistant(_that.isAIAssistantEnabled);
      case SelectCategory() when selectCategory != null:
        return selectCategory(_that.category);
      case SelectLanguage() when selectLanguage != null:
        return selectLanguage(_that.language);
      case AddCourse() when addCourse != null:
        return addCourse();
      case AddCourseSuccess() when addCourseSuccess != null:
        return addCourseSuccess(_that.message);
      case AddCourseError() when addCourseError != null:
        return addCourseError(_that.error);
      case UpdateCourse() when updateCourse != null:
        return updateCourse();
      case UpdateCourseSuccess() when updateCourseSuccess != null:
        return updateCourseSuccess(_that.message);
      case UpdateCourseError() when updateCourseError != null:
        return updateCourseError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements HomeInstructorState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeInstructorState<$T>.initial()';
  }
}

/// @nodoc

class HomeIstructorLoading<T> implements HomeInstructorState<T> {
  const HomeIstructorLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeIstructorLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeInstructorState<$T>.homeIstructorLoading()';
  }
}

/// @nodoc

class HomeIstructorSuccess<T> implements HomeInstructorState<T> {
  const HomeIstructorSuccess(
      {required this.profileDate,
      required this.totalStudents,
      required this.totalCourses,
      required this.avgRating,
      required this.avgCompletionRate,
      required final List<CourseInfoModelWithStudentCountAndCompletionRateModel>
          courseInfoModelWithStudentCountAndCompletionRateModel})
      : _courseInfoModelWithStudentCountAndCompletionRateModel =
            courseInfoModelWithStudentCountAndCompletionRateModel;

  final ProfileAccountModel profileDate;
  final int totalStudents;
  final int totalCourses;
  final double avgRating;
  final double avgCompletionRate;
  final List<CourseInfoModelWithStudentCountAndCompletionRateModel>
      _courseInfoModelWithStudentCountAndCompletionRateModel;
  List<CourseInfoModelWithStudentCountAndCompletionRateModel>
      get courseInfoModelWithStudentCountAndCompletionRateModel {
    if (_courseInfoModelWithStudentCountAndCompletionRateModel
        is EqualUnmodifiableListView)
      return _courseInfoModelWithStudentCountAndCompletionRateModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(
        _courseInfoModelWithStudentCountAndCompletionRateModel);
  }

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeIstructorSuccessCopyWith<T, HomeIstructorSuccess<T>> get copyWith =>
      _$HomeIstructorSuccessCopyWithImpl<T, HomeIstructorSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeIstructorSuccess<T> &&
            (identical(other.profileDate, profileDate) ||
                other.profileDate == profileDate) &&
            (identical(other.totalStudents, totalStudents) ||
                other.totalStudents == totalStudents) &&
            (identical(other.totalCourses, totalCourses) ||
                other.totalCourses == totalCourses) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.avgCompletionRate, avgCompletionRate) ||
                other.avgCompletionRate == avgCompletionRate) &&
            const DeepCollectionEquality().equals(
                other._courseInfoModelWithStudentCountAndCompletionRateModel,
                _courseInfoModelWithStudentCountAndCompletionRateModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileDate,
      totalStudents,
      totalCourses,
      avgRating,
      avgCompletionRate,
      const DeepCollectionEquality()
          .hash(_courseInfoModelWithStudentCountAndCompletionRateModel));

  @override
  String toString() {
    return 'HomeInstructorState<$T>.homeIstructorSuccess(profileDate: $profileDate, totalStudents: $totalStudents, totalCourses: $totalCourses, avgRating: $avgRating, avgCompletionRate: $avgCompletionRate, courseInfoModelWithStudentCountAndCompletionRateModel: $courseInfoModelWithStudentCountAndCompletionRateModel)';
  }
}

/// @nodoc
abstract mixin class $HomeIstructorSuccessCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $HomeIstructorSuccessCopyWith(HomeIstructorSuccess<T> value,
          $Res Function(HomeIstructorSuccess<T>) _then) =
      _$HomeIstructorSuccessCopyWithImpl;
  @useResult
  $Res call(
      {ProfileAccountModel profileDate,
      int totalStudents,
      int totalCourses,
      double avgRating,
      double avgCompletionRate,
      List<CourseInfoModelWithStudentCountAndCompletionRateModel>
          courseInfoModelWithStudentCountAndCompletionRateModel});
}

/// @nodoc
class _$HomeIstructorSuccessCopyWithImpl<T, $Res>
    implements $HomeIstructorSuccessCopyWith<T, $Res> {
  _$HomeIstructorSuccessCopyWithImpl(this._self, this._then);

  final HomeIstructorSuccess<T> _self;
  final $Res Function(HomeIstructorSuccess<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileDate = null,
    Object? totalStudents = null,
    Object? totalCourses = null,
    Object? avgRating = null,
    Object? avgCompletionRate = null,
    Object? courseInfoModelWithStudentCountAndCompletionRateModel = null,
  }) {
    return _then(HomeIstructorSuccess<T>(
      profileDate: null == profileDate
          ? _self.profileDate
          : profileDate // ignore: cast_nullable_to_non_nullable
              as ProfileAccountModel,
      totalStudents: null == totalStudents
          ? _self.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int,
      totalCourses: null == totalCourses
          ? _self.totalCourses
          : totalCourses // ignore: cast_nullable_to_non_nullable
              as int,
      avgRating: null == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      avgCompletionRate: null == avgCompletionRate
          ? _self.avgCompletionRate
          : avgCompletionRate // ignore: cast_nullable_to_non_nullable
              as double,
      courseInfoModelWithStudentCountAndCompletionRateModel: null ==
              courseInfoModelWithStudentCountAndCompletionRateModel
          ? _self._courseInfoModelWithStudentCountAndCompletionRateModel
          : courseInfoModelWithStudentCountAndCompletionRateModel // ignore: cast_nullable_to_non_nullable
              as List<CourseInfoModelWithStudentCountAndCompletionRateModel>,
    ));
  }
}

/// @nodoc

class HomeIstructorError<T> implements HomeInstructorState<T> {
  const HomeIstructorError({required this.error});

  final String error;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeIstructorErrorCopyWith<T, HomeIstructorError<T>> get copyWith =>
      _$HomeIstructorErrorCopyWithImpl<T, HomeIstructorError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeIstructorError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.homeIstructorError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $HomeIstructorErrorCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $HomeIstructorErrorCopyWith(HomeIstructorError<T> value,
          $Res Function(HomeIstructorError<T>) _then) =
      _$HomeIstructorErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$HomeIstructorErrorCopyWithImpl<T, $Res>
    implements $HomeIstructorErrorCopyWith<T, $Res> {
  _$HomeIstructorErrorCopyWithImpl(this._self, this._then);

  final HomeIstructorError<T> _self;
  final $Res Function(HomeIstructorError<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(HomeIstructorError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TogglePublished<T> implements HomeInstructorState<T> {
  const TogglePublished(this.isPublished);

  final bool isPublished;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TogglePublishedCopyWith<T, TogglePublished<T>> get copyWith =>
      _$TogglePublishedCopyWithImpl<T, TogglePublished<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TogglePublished<T> &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPublished);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.togglePublished(isPublished: $isPublished)';
  }
}

/// @nodoc
abstract mixin class $TogglePublishedCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $TogglePublishedCopyWith(
          TogglePublished<T> value, $Res Function(TogglePublished<T>) _then) =
      _$TogglePublishedCopyWithImpl;
  @useResult
  $Res call({bool isPublished});
}

/// @nodoc
class _$TogglePublishedCopyWithImpl<T, $Res>
    implements $TogglePublishedCopyWith<T, $Res> {
  _$TogglePublishedCopyWithImpl(this._self, this._then);

  final TogglePublished<T> _self;
  final $Res Function(TogglePublished<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isPublished = null,
  }) {
    return _then(TogglePublished<T>(
      null == isPublished
          ? _self.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ToggleAIAssistant<T> implements HomeInstructorState<T> {
  const ToggleAIAssistant(this.isAIAssistantEnabled);

  final bool isAIAssistantEnabled;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleAIAssistantCopyWith<T, ToggleAIAssistant<T>> get copyWith =>
      _$ToggleAIAssistantCopyWithImpl<T, ToggleAIAssistant<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleAIAssistant<T> &&
            (identical(other.isAIAssistantEnabled, isAIAssistantEnabled) ||
                other.isAIAssistantEnabled == isAIAssistantEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAIAssistantEnabled);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.toggleAIAssistant(isAIAssistantEnabled: $isAIAssistantEnabled)';
  }
}

/// @nodoc
abstract mixin class $ToggleAIAssistantCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $ToggleAIAssistantCopyWith(ToggleAIAssistant<T> value,
          $Res Function(ToggleAIAssistant<T>) _then) =
      _$ToggleAIAssistantCopyWithImpl;
  @useResult
  $Res call({bool isAIAssistantEnabled});
}

/// @nodoc
class _$ToggleAIAssistantCopyWithImpl<T, $Res>
    implements $ToggleAIAssistantCopyWith<T, $Res> {
  _$ToggleAIAssistantCopyWithImpl(this._self, this._then);

  final ToggleAIAssistant<T> _self;
  final $Res Function(ToggleAIAssistant<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isAIAssistantEnabled = null,
  }) {
    return _then(ToggleAIAssistant<T>(
      null == isAIAssistantEnabled
          ? _self.isAIAssistantEnabled
          : isAIAssistantEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class SelectCategory<T> implements HomeInstructorState<T> {
  const SelectCategory(this.category);

  final String category;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectCategoryCopyWith<T, SelectCategory<T>> get copyWith =>
      _$SelectCategoryCopyWithImpl<T, SelectCategory<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectCategory<T> &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.selectCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class $SelectCategoryCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $SelectCategoryCopyWith(
          SelectCategory<T> value, $Res Function(SelectCategory<T>) _then) =
      _$SelectCategoryCopyWithImpl;
  @useResult
  $Res call({String category});
}

/// @nodoc
class _$SelectCategoryCopyWithImpl<T, $Res>
    implements $SelectCategoryCopyWith<T, $Res> {
  _$SelectCategoryCopyWithImpl(this._self, this._then);

  final SelectCategory<T> _self;
  final $Res Function(SelectCategory<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(SelectCategory<T>(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SelectLanguage<T> implements HomeInstructorState<T> {
  const SelectLanguage(this.language);

  final String language;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectLanguageCopyWith<T, SelectLanguage<T>> get copyWith =>
      _$SelectLanguageCopyWithImpl<T, SelectLanguage<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectLanguage<T> &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.selectLanguage(language: $language)';
  }
}

/// @nodoc
abstract mixin class $SelectLanguageCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $SelectLanguageCopyWith(
          SelectLanguage<T> value, $Res Function(SelectLanguage<T>) _then) =
      _$SelectLanguageCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$SelectLanguageCopyWithImpl<T, $Res>
    implements $SelectLanguageCopyWith<T, $Res> {
  _$SelectLanguageCopyWithImpl(this._self, this._then);

  final SelectLanguage<T> _self;
  final $Res Function(SelectLanguage<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(SelectLanguage<T>(
      null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddCourse<T> implements HomeInstructorState<T> {
  const AddCourse();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddCourse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeInstructorState<$T>.addCourse()';
  }
}

/// @nodoc

class AddCourseSuccess<T> implements HomeInstructorState<T> {
  const AddCourseSuccess({required this.message});

  final String message;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCourseSuccessCopyWith<T, AddCourseSuccess<T>> get copyWith =>
      _$AddCourseSuccessCopyWithImpl<T, AddCourseSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCourseSuccess<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.addCourseSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddCourseSuccessCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $AddCourseSuccessCopyWith(
          AddCourseSuccess<T> value, $Res Function(AddCourseSuccess<T>) _then) =
      _$AddCourseSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddCourseSuccessCopyWithImpl<T, $Res>
    implements $AddCourseSuccessCopyWith<T, $Res> {
  _$AddCourseSuccessCopyWithImpl(this._self, this._then);

  final AddCourseSuccess<T> _self;
  final $Res Function(AddCourseSuccess<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddCourseSuccess<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddCourseError<T> implements HomeInstructorState<T> {
  const AddCourseError({required this.error});

  final String error;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCourseErrorCopyWith<T, AddCourseError<T>> get copyWith =>
      _$AddCourseErrorCopyWithImpl<T, AddCourseError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCourseError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.addCourseError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $AddCourseErrorCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $AddCourseErrorCopyWith(
          AddCourseError<T> value, $Res Function(AddCourseError<T>) _then) =
      _$AddCourseErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$AddCourseErrorCopyWithImpl<T, $Res>
    implements $AddCourseErrorCopyWith<T, $Res> {
  _$AddCourseErrorCopyWithImpl(this._self, this._then);

  final AddCourseError<T> _self;
  final $Res Function(AddCourseError<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(AddCourseError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateCourse<T> implements HomeInstructorState<T> {
  const UpdateCourse();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdateCourse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeInstructorState<$T>.updateCourse()';
  }
}

/// @nodoc

class UpdateCourseSuccess<T> implements HomeInstructorState<T> {
  const UpdateCourseSuccess({required this.message});

  final String message;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCourseSuccessCopyWith<T, UpdateCourseSuccess<T>> get copyWith =>
      _$UpdateCourseSuccessCopyWithImpl<T, UpdateCourseSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCourseSuccess<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.updateCourseSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UpdateCourseSuccessCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $UpdateCourseSuccessCopyWith(UpdateCourseSuccess<T> value,
          $Res Function(UpdateCourseSuccess<T>) _then) =
      _$UpdateCourseSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UpdateCourseSuccessCopyWithImpl<T, $Res>
    implements $UpdateCourseSuccessCopyWith<T, $Res> {
  _$UpdateCourseSuccessCopyWithImpl(this._self, this._then);

  final UpdateCourseSuccess<T> _self;
  final $Res Function(UpdateCourseSuccess<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UpdateCourseSuccess<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateCourseError<T> implements HomeInstructorState<T> {
  const UpdateCourseError({required this.error});

  final String error;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCourseErrorCopyWith<T, UpdateCourseError<T>> get copyWith =>
      _$UpdateCourseErrorCopyWithImpl<T, UpdateCourseError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCourseError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeInstructorState<$T>.updateCourseError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $UpdateCourseErrorCopyWith<T, $Res>
    implements $HomeInstructorStateCopyWith<T, $Res> {
  factory $UpdateCourseErrorCopyWith(UpdateCourseError<T> value,
          $Res Function(UpdateCourseError<T>) _then) =
      _$UpdateCourseErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$UpdateCourseErrorCopyWithImpl<T, $Res>
    implements $UpdateCourseErrorCopyWith<T, $Res> {
  _$UpdateCourseErrorCopyWithImpl(this._self, this._then);

  final UpdateCourseError<T> _self;
  final $Res Function(UpdateCourseError<T>) _then;

  /// Create a copy of HomeInstructorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(UpdateCourseError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
