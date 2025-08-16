// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_courses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyCoursesState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MyCoursesState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MyCoursesState<$T>()';
  }
}

/// @nodoc
class $MyCoursesStateCopyWith<T, $Res> {
  $MyCoursesStateCopyWith(
      MyCoursesState<T> _, $Res Function(MyCoursesState<T>) __);
}

/// Adds pattern-matching-related methods to [MyCoursesState].
extension MyCoursesStatePatterns<T> on MyCoursesState<T> {
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
    TResult Function(MyCoursesLoading<T> value)? myCoursesLoading,
    TResult Function(MyCoursesLoaded<T> value)? myCoursesLoaded,
    TResult Function(MyCoursesLoadedError<T> value)? myCoursesLoadedError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case MyCoursesLoading() when myCoursesLoading != null:
        return myCoursesLoading(_that);
      case MyCoursesLoaded() when myCoursesLoaded != null:
        return myCoursesLoaded(_that);
      case MyCoursesLoadedError() when myCoursesLoadedError != null:
        return myCoursesLoadedError(_that);
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
    required TResult Function(MyCoursesLoading<T> value) myCoursesLoading,
    required TResult Function(MyCoursesLoaded<T> value) myCoursesLoaded,
    required TResult Function(MyCoursesLoadedError<T> value)
        myCoursesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case MyCoursesLoading():
        return myCoursesLoading(_that);
      case MyCoursesLoaded():
        return myCoursesLoaded(_that);
      case MyCoursesLoadedError():
        return myCoursesLoadedError(_that);
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
    TResult? Function(MyCoursesLoading<T> value)? myCoursesLoading,
    TResult? Function(MyCoursesLoaded<T> value)? myCoursesLoaded,
    TResult? Function(MyCoursesLoadedError<T> value)? myCoursesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case MyCoursesLoading() when myCoursesLoading != null:
        return myCoursesLoading(_that);
      case MyCoursesLoaded() when myCoursesLoaded != null:
        return myCoursesLoaded(_that);
      case MyCoursesLoadedError() when myCoursesLoadedError != null:
        return myCoursesLoadedError(_that);
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
    TResult Function()? myCoursesLoading,
    TResult Function(List<CourseInfoModel> studentEnrollments,
            List<StudentEnrollmentsModel> studentEnrollmentsCoursesInfo)?
        myCoursesLoaded,
    TResult Function(String errorMessage)? myCoursesLoadedError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case MyCoursesLoading() when myCoursesLoading != null:
        return myCoursesLoading();
      case MyCoursesLoaded() when myCoursesLoaded != null:
        return myCoursesLoaded(
            _that.studentEnrollments, _that.studentEnrollmentsCoursesInfo);
      case MyCoursesLoadedError() when myCoursesLoadedError != null:
        return myCoursesLoadedError(_that.errorMessage);
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
    required TResult Function() myCoursesLoading,
    required TResult Function(List<CourseInfoModel> studentEnrollments,
            List<StudentEnrollmentsModel> studentEnrollmentsCoursesInfo)
        myCoursesLoaded,
    required TResult Function(String errorMessage) myCoursesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case MyCoursesLoading():
        return myCoursesLoading();
      case MyCoursesLoaded():
        return myCoursesLoaded(
            _that.studentEnrollments, _that.studentEnrollmentsCoursesInfo);
      case MyCoursesLoadedError():
        return myCoursesLoadedError(_that.errorMessage);
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
    TResult? Function()? myCoursesLoading,
    TResult? Function(List<CourseInfoModel> studentEnrollments,
            List<StudentEnrollmentsModel> studentEnrollmentsCoursesInfo)?
        myCoursesLoaded,
    TResult? Function(String errorMessage)? myCoursesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case MyCoursesLoading() when myCoursesLoading != null:
        return myCoursesLoading();
      case MyCoursesLoaded() when myCoursesLoaded != null:
        return myCoursesLoaded(
            _that.studentEnrollments, _that.studentEnrollmentsCoursesInfo);
      case MyCoursesLoadedError() when myCoursesLoadedError != null:
        return myCoursesLoadedError(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements MyCoursesState<T> {
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
    return 'MyCoursesState<$T>.initial()';
  }
}

/// @nodoc

class MyCoursesLoading<T> implements MyCoursesState<T> {
  const MyCoursesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MyCoursesLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MyCoursesState<$T>.myCoursesLoading()';
  }
}

/// @nodoc

class MyCoursesLoaded<T> implements MyCoursesState<T> {
  const MyCoursesLoaded(
      {required final List<CourseInfoModel> studentEnrollments,
      required final List<StudentEnrollmentsModel>
          studentEnrollmentsCoursesInfo})
      : _studentEnrollments = studentEnrollments,
        _studentEnrollmentsCoursesInfo = studentEnrollmentsCoursesInfo;

  final List<CourseInfoModel> _studentEnrollments;
  List<CourseInfoModel> get studentEnrollments {
    if (_studentEnrollments is EqualUnmodifiableListView)
      return _studentEnrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studentEnrollments);
  }

  final List<StudentEnrollmentsModel> _studentEnrollmentsCoursesInfo;
  List<StudentEnrollmentsModel> get studentEnrollmentsCoursesInfo {
    if (_studentEnrollmentsCoursesInfo is EqualUnmodifiableListView)
      return _studentEnrollmentsCoursesInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studentEnrollmentsCoursesInfo);
  }

  /// Create a copy of MyCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyCoursesLoadedCopyWith<T, MyCoursesLoaded<T>> get copyWith =>
      _$MyCoursesLoadedCopyWithImpl<T, MyCoursesLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyCoursesLoaded<T> &&
            const DeepCollectionEquality()
                .equals(other._studentEnrollments, _studentEnrollments) &&
            const DeepCollectionEquality().equals(
                other._studentEnrollmentsCoursesInfo,
                _studentEnrollmentsCoursesInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_studentEnrollments),
      const DeepCollectionEquality().hash(_studentEnrollmentsCoursesInfo));

  @override
  String toString() {
    return 'MyCoursesState<$T>.myCoursesLoaded(studentEnrollments: $studentEnrollments, studentEnrollmentsCoursesInfo: $studentEnrollmentsCoursesInfo)';
  }
}

/// @nodoc
abstract mixin class $MyCoursesLoadedCopyWith<T, $Res>
    implements $MyCoursesStateCopyWith<T, $Res> {
  factory $MyCoursesLoadedCopyWith(
          MyCoursesLoaded<T> value, $Res Function(MyCoursesLoaded<T>) _then) =
      _$MyCoursesLoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<CourseInfoModel> studentEnrollments,
      List<StudentEnrollmentsModel> studentEnrollmentsCoursesInfo});
}

/// @nodoc
class _$MyCoursesLoadedCopyWithImpl<T, $Res>
    implements $MyCoursesLoadedCopyWith<T, $Res> {
  _$MyCoursesLoadedCopyWithImpl(this._self, this._then);

  final MyCoursesLoaded<T> _self;
  final $Res Function(MyCoursesLoaded<T>) _then;

  /// Create a copy of MyCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? studentEnrollments = null,
    Object? studentEnrollmentsCoursesInfo = null,
  }) {
    return _then(MyCoursesLoaded<T>(
      studentEnrollments: null == studentEnrollments
          ? _self._studentEnrollments
          : studentEnrollments // ignore: cast_nullable_to_non_nullable
              as List<CourseInfoModel>,
      studentEnrollmentsCoursesInfo: null == studentEnrollmentsCoursesInfo
          ? _self._studentEnrollmentsCoursesInfo
          : studentEnrollmentsCoursesInfo // ignore: cast_nullable_to_non_nullable
              as List<StudentEnrollmentsModel>,
    ));
  }
}

/// @nodoc

class MyCoursesLoadedError<T> implements MyCoursesState<T> {
  const MyCoursesLoadedError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of MyCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyCoursesLoadedErrorCopyWith<T, MyCoursesLoadedError<T>> get copyWith =>
      _$MyCoursesLoadedErrorCopyWithImpl<T, MyCoursesLoadedError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyCoursesLoadedError<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'MyCoursesState<$T>.myCoursesLoadedError(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $MyCoursesLoadedErrorCopyWith<T, $Res>
    implements $MyCoursesStateCopyWith<T, $Res> {
  factory $MyCoursesLoadedErrorCopyWith(MyCoursesLoadedError<T> value,
          $Res Function(MyCoursesLoadedError<T>) _then) =
      _$MyCoursesLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$MyCoursesLoadedErrorCopyWithImpl<T, $Res>
    implements $MyCoursesLoadedErrorCopyWith<T, $Res> {
  _$MyCoursesLoadedErrorCopyWithImpl(this._self, this._then);

  final MyCoursesLoadedError<T> _self;
  final $Res Function(MyCoursesLoadedError<T>) _then;

  /// Create a copy of MyCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(MyCoursesLoadedError<T>(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
