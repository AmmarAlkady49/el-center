// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchState<$T>()';
  }
}

/// @nodoc
class $SearchStateCopyWith<T, $Res> {
  $SearchStateCopyWith(SearchState<T> _, $Res Function(SearchState<T>) __);
}

/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns<T> on SearchState<T> {
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
    TResult Function(Initial<T> value)? initial,
    TResult Function(CourseSearching<T> value)? courseSearching,
    TResult Function(CourseSearched<T> value)? courseSearched,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case CourseSearching() when courseSearching != null:
        return courseSearching(_that);
      case CourseSearched() when courseSearched != null:
        return courseSearched(_that);
      case Error() when error != null:
        return error(_that);
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
    required TResult Function(Initial<T> value) initial,
    required TResult Function(CourseSearching<T> value) courseSearching,
    required TResult Function(CourseSearched<T> value) courseSearched,
    required TResult Function(Error<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that);
      case CourseSearching():
        return courseSearching(_that);
      case CourseSearched():
        return courseSearched(_that);
      case Error():
        return error(_that);
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
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(CourseSearching<T> value)? courseSearching,
    TResult? Function(CourseSearched<T> value)? courseSearched,
    TResult? Function(Error<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case CourseSearching() when courseSearching != null:
        return courseSearching(_that);
      case CourseSearched() when courseSearched != null:
        return courseSearched(_that);
      case Error() when error != null:
        return error(_that);
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
    TResult Function()? courseSearching,
    TResult Function(List<CourseInfoModel> courses)? courseSearched,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case CourseSearching() when courseSearching != null:
        return courseSearching();
      case CourseSearched() when courseSearched != null:
        return courseSearched(_that.courses);
      case Error() when error != null:
        return error(_that.message);
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
    required TResult Function() courseSearching,
    required TResult Function(List<CourseInfoModel> courses) courseSearched,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial();
      case CourseSearching():
        return courseSearching();
      case CourseSearched():
        return courseSearched(_that.courses);
      case Error():
        return error(_that.message);
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
    TResult? Function()? courseSearching,
    TResult? Function(List<CourseInfoModel> courses)? courseSearched,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case CourseSearching() when courseSearching != null:
        return courseSearching();
      case CourseSearched() when courseSearched != null:
        return courseSearched(_that.courses);
      case Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Initial<T> implements SearchState<T> {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchState<$T>.initial()';
  }
}

/// @nodoc

class CourseSearching<T> implements SearchState<T> {
  const CourseSearching();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CourseSearching<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchState<$T>.courseSearching()';
  }
}

/// @nodoc

class CourseSearched<T> implements SearchState<T> {
  const CourseSearched({required final List<CourseInfoModel> courses})
      : _courses = courses;

  final List<CourseInfoModel> _courses;
  List<CourseInfoModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseSearchedCopyWith<T, CourseSearched<T>> get copyWith =>
      _$CourseSearchedCopyWithImpl<T, CourseSearched<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseSearched<T> &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @override
  String toString() {
    return 'SearchState<$T>.courseSearched(courses: $courses)';
  }
}

/// @nodoc
abstract mixin class $CourseSearchedCopyWith<T, $Res>
    implements $SearchStateCopyWith<T, $Res> {
  factory $CourseSearchedCopyWith(
          CourseSearched<T> value, $Res Function(CourseSearched<T>) _then) =
      _$CourseSearchedCopyWithImpl;
  @useResult
  $Res call({List<CourseInfoModel> courses});
}

/// @nodoc
class _$CourseSearchedCopyWithImpl<T, $Res>
    implements $CourseSearchedCopyWith<T, $Res> {
  _$CourseSearchedCopyWithImpl(this._self, this._then);

  final CourseSearched<T> _self;
  final $Res Function(CourseSearched<T>) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courses = null,
  }) {
    return _then(CourseSearched<T>(
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseInfoModel>,
    ));
  }
}

/// @nodoc

class Error<T> implements SearchState<T> {
  const Error({required this.message});

  final String message;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<T, Error<T>> get copyWith =>
      _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SearchState<$T>.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<T, $Res>
    implements $SearchStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<T, $Res> implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(Error<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
