// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState<$T>()';
  }
}

/// @nodoc
class $LoginStateCopyWith<T, $Res> {
  $LoginStateCopyWith(LoginState<T> _, $Res Function(LoginState<T>) __);
}

/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns<T> on LoginState<T> {
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
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(GoogleLoginSuccess<T> value)? googleLoginSuccess,
    TResult Function(GoogleLoginError<T> value)? googleLoginError,
    TResult Function(GoogleLoginLoading<T> value)? googleLoginLoading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Success() when success != null:
        return success(_that);
      case Error() when error != null:
        return error(_that);
      case GoogleLoginSuccess() when googleLoginSuccess != null:
        return googleLoginSuccess(_that);
      case GoogleLoginError() when googleLoginError != null:
        return googleLoginError(_that);
      case GoogleLoginLoading() when googleLoginLoading != null:
        return googleLoginLoading(_that);
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(GoogleLoginSuccess<T> value) googleLoginSuccess,
    required TResult Function(GoogleLoginError<T> value) googleLoginError,
    required TResult Function(GoogleLoginLoading<T> value) googleLoginLoading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case Loading():
        return loading(_that);
      case Success():
        return success(_that);
      case Error():
        return error(_that);
      case GoogleLoginSuccess():
        return googleLoginSuccess(_that);
      case GoogleLoginError():
        return googleLoginError(_that);
      case GoogleLoginLoading():
        return googleLoginLoading(_that);
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
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GoogleLoginSuccess<T> value)? googleLoginSuccess,
    TResult? Function(GoogleLoginError<T> value)? googleLoginError,
    TResult? Function(GoogleLoginLoading<T> value)? googleLoginLoading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Success() when success != null:
        return success(_that);
      case Error() when error != null:
        return error(_that);
      case GoogleLoginSuccess() when googleLoginSuccess != null:
        return googleLoginSuccess(_that);
      case GoogleLoginError() when googleLoginError != null:
        return googleLoginError(_that);
      case GoogleLoginLoading() when googleLoginLoading != null:
        return googleLoginLoading(_that);
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
    TResult Function()? loading,
    TResult Function(bool isStudent)? success,
    TResult Function(String error)? error,
    TResult Function(T user)? googleLoginSuccess,
    TResult Function(String error)? googleLoginError,
    TResult Function()? googleLoginLoading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Loading() when loading != null:
        return loading();
      case Success() when success != null:
        return success(_that.isStudent);
      case Error() when error != null:
        return error(_that.error);
      case GoogleLoginSuccess() when googleLoginSuccess != null:
        return googleLoginSuccess(_that.user);
      case GoogleLoginError() when googleLoginError != null:
        return googleLoginError(_that.error);
      case GoogleLoginLoading() when googleLoginLoading != null:
        return googleLoginLoading();
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
    required TResult Function() loading,
    required TResult Function(bool isStudent) success,
    required TResult Function(String error) error,
    required TResult Function(T user) googleLoginSuccess,
    required TResult Function(String error) googleLoginError,
    required TResult Function() googleLoginLoading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case Loading():
        return loading();
      case Success():
        return success(_that.isStudent);
      case Error():
        return error(_that.error);
      case GoogleLoginSuccess():
        return googleLoginSuccess(_that.user);
      case GoogleLoginError():
        return googleLoginError(_that.error);
      case GoogleLoginLoading():
        return googleLoginLoading();
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
    TResult? Function()? loading,
    TResult? Function(bool isStudent)? success,
    TResult? Function(String error)? error,
    TResult? Function(T user)? googleLoginSuccess,
    TResult? Function(String error)? googleLoginError,
    TResult? Function()? googleLoginLoading,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Loading() when loading != null:
        return loading();
      case Success() when success != null:
        return success(_that.isStudent);
      case Error() when error != null:
        return error(_that.error);
      case GoogleLoginSuccess() when googleLoginSuccess != null:
        return googleLoginSuccess(_that.user);
      case GoogleLoginError() when googleLoginError != null:
        return googleLoginError(_that.error);
      case GoogleLoginLoading() when googleLoginLoading != null:
        return googleLoginLoading();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements LoginState<T> {
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
    return 'LoginState<$T>.initial()';
  }
}

/// @nodoc

class Loading<T> implements LoginState<T> {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState<$T>.loading()';
  }
}

/// @nodoc

class Success<T> implements LoginState<T> {
  const Success(this.isStudent);

  final bool isStudent;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T> &&
            (identical(other.isStudent, isStudent) ||
                other.isStudent == isStudent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isStudent);

  @override
  String toString() {
    return 'LoginState<$T>.success(isStudent: $isStudent)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<T, $Res>
    implements $LoginStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({bool isStudent});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isStudent = null,
  }) {
    return _then(Success<T>(
      null == isStudent
          ? _self.isStudent
          : isStudent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class Error<T> implements LoginState<T> {
  const Error({required this.error});

  final String error;

  /// Create a copy of LoginState
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
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LoginState<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<T, $Res>
    implements $LoginStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ErrorCopyWithImpl<T, $Res> implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Error<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GoogleLoginSuccess<T> implements LoginState<T> {
  const GoogleLoginSuccess(this.user);

  final T user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoogleLoginSuccessCopyWith<T, GoogleLoginSuccess<T>> get copyWith =>
      _$GoogleLoginSuccessCopyWithImpl<T, GoogleLoginSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoogleLoginSuccess<T> &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @override
  String toString() {
    return 'LoginState<$T>.googleLoginSuccess(user: $user)';
  }
}

/// @nodoc
abstract mixin class $GoogleLoginSuccessCopyWith<T, $Res>
    implements $LoginStateCopyWith<T, $Res> {
  factory $GoogleLoginSuccessCopyWith(GoogleLoginSuccess<T> value,
          $Res Function(GoogleLoginSuccess<T>) _then) =
      _$GoogleLoginSuccessCopyWithImpl;
  @useResult
  $Res call({T user});
}

/// @nodoc
class _$GoogleLoginSuccessCopyWithImpl<T, $Res>
    implements $GoogleLoginSuccessCopyWith<T, $Res> {
  _$GoogleLoginSuccessCopyWithImpl(this._self, this._then);

  final GoogleLoginSuccess<T> _self;
  final $Res Function(GoogleLoginSuccess<T>) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
  }) {
    return _then(GoogleLoginSuccess<T>(
      freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class GoogleLoginError<T> implements LoginState<T> {
  const GoogleLoginError({required this.error});

  final String error;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoogleLoginErrorCopyWith<T, GoogleLoginError<T>> get copyWith =>
      _$GoogleLoginErrorCopyWithImpl<T, GoogleLoginError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoogleLoginError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'LoginState<$T>.googleLoginError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $GoogleLoginErrorCopyWith<T, $Res>
    implements $LoginStateCopyWith<T, $Res> {
  factory $GoogleLoginErrorCopyWith(
          GoogleLoginError<T> value, $Res Function(GoogleLoginError<T>) _then) =
      _$GoogleLoginErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$GoogleLoginErrorCopyWithImpl<T, $Res>
    implements $GoogleLoginErrorCopyWith<T, $Res> {
  _$GoogleLoginErrorCopyWithImpl(this._self, this._then);

  final GoogleLoginError<T> _self;
  final $Res Function(GoogleLoginError<T>) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(GoogleLoginError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GoogleLoginLoading<T> implements LoginState<T> {
  const GoogleLoginLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GoogleLoginLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState<$T>.googleLoginLoading()';
  }
}

// dart format on
