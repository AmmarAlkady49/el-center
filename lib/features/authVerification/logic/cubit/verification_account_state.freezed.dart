// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationAccountState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationAccountState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerificationAccountState<$T>()';
  }
}

/// @nodoc
class $VerificationAccountStateCopyWith<T, $Res> {
  $VerificationAccountStateCopyWith(VerificationAccountState<T> _,
      $Res Function(VerificationAccountState<T>) __);
}

/// Adds pattern-matching-related methods to [VerificationAccountState].
extension VerificationAccountStatePatterns<T> on VerificationAccountState<T> {
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
    TResult Function(ActiveAccountLoading<T> value)? activeAccountLoading,
    TResult Function(ActiveAccountSuccess<T> value)? activeAccountSuccess,
    TResult Function(ActiveAccountError<T> value)? activeAccountError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ActiveAccountLoading() when activeAccountLoading != null:
        return activeAccountLoading(_that);
      case ActiveAccountSuccess() when activeAccountSuccess != null:
        return activeAccountSuccess(_that);
      case ActiveAccountError() when activeAccountError != null:
        return activeAccountError(_that);
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
    required TResult Function(ActiveAccountLoading<T> value)
        activeAccountLoading,
    required TResult Function(ActiveAccountSuccess<T> value)
        activeAccountSuccess,
    required TResult Function(ActiveAccountError<T> value) activeAccountError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case ActiveAccountLoading():
        return activeAccountLoading(_that);
      case ActiveAccountSuccess():
        return activeAccountSuccess(_that);
      case ActiveAccountError():
        return activeAccountError(_that);
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
    TResult? Function(ActiveAccountLoading<T> value)? activeAccountLoading,
    TResult? Function(ActiveAccountSuccess<T> value)? activeAccountSuccess,
    TResult? Function(ActiveAccountError<T> value)? activeAccountError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ActiveAccountLoading() when activeAccountLoading != null:
        return activeAccountLoading(_that);
      case ActiveAccountSuccess() when activeAccountSuccess != null:
        return activeAccountSuccess(_that);
      case ActiveAccountError() when activeAccountError != null:
        return activeAccountError(_that);
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
    TResult Function()? activeAccountLoading,
    TResult Function(T data)? activeAccountSuccess,
    TResult Function(String error)? activeAccountError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ActiveAccountLoading() when activeAccountLoading != null:
        return activeAccountLoading();
      case ActiveAccountSuccess() when activeAccountSuccess != null:
        return activeAccountSuccess(_that.data);
      case ActiveAccountError() when activeAccountError != null:
        return activeAccountError(_that.error);
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
    required TResult Function() activeAccountLoading,
    required TResult Function(T data) activeAccountSuccess,
    required TResult Function(String error) activeAccountError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case ActiveAccountLoading():
        return activeAccountLoading();
      case ActiveAccountSuccess():
        return activeAccountSuccess(_that.data);
      case ActiveAccountError():
        return activeAccountError(_that.error);
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
    TResult? Function()? activeAccountLoading,
    TResult? Function(T data)? activeAccountSuccess,
    TResult? Function(String error)? activeAccountError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ActiveAccountLoading() when activeAccountLoading != null:
        return activeAccountLoading();
      case ActiveAccountSuccess() when activeAccountSuccess != null:
        return activeAccountSuccess(_that.data);
      case ActiveAccountError() when activeAccountError != null:
        return activeAccountError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements VerificationAccountState<T> {
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
    return 'VerificationAccountState<$T>.initial()';
  }
}

/// @nodoc

class ActiveAccountLoading<T> implements VerificationAccountState<T> {
  const ActiveAccountLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActiveAccountLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerificationAccountState<$T>.activeAccountLoading()';
  }
}

/// @nodoc

class ActiveAccountSuccess<T> implements VerificationAccountState<T> {
  const ActiveAccountSuccess(this.data);

  final T data;

  /// Create a copy of VerificationAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveAccountSuccessCopyWith<T, ActiveAccountSuccess<T>> get copyWith =>
      _$ActiveAccountSuccessCopyWithImpl<T, ActiveAccountSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveAccountSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'VerificationAccountState<$T>.activeAccountSuccess(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ActiveAccountSuccessCopyWith<T, $Res>
    implements $VerificationAccountStateCopyWith<T, $Res> {
  factory $ActiveAccountSuccessCopyWith(ActiveAccountSuccess<T> value,
          $Res Function(ActiveAccountSuccess<T>) _then) =
      _$ActiveAccountSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ActiveAccountSuccessCopyWithImpl<T, $Res>
    implements $ActiveAccountSuccessCopyWith<T, $Res> {
  _$ActiveAccountSuccessCopyWithImpl(this._self, this._then);

  final ActiveAccountSuccess<T> _self;
  final $Res Function(ActiveAccountSuccess<T>) _then;

  /// Create a copy of VerificationAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ActiveAccountSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ActiveAccountError<T> implements VerificationAccountState<T> {
  const ActiveAccountError({required this.error});

  final String error;

  /// Create a copy of VerificationAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActiveAccountErrorCopyWith<T, ActiveAccountError<T>> get copyWith =>
      _$ActiveAccountErrorCopyWithImpl<T, ActiveAccountError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActiveAccountError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'VerificationAccountState<$T>.activeAccountError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ActiveAccountErrorCopyWith<T, $Res>
    implements $VerificationAccountStateCopyWith<T, $Res> {
  factory $ActiveAccountErrorCopyWith(ActiveAccountError<T> value,
          $Res Function(ActiveAccountError<T>) _then) =
      _$ActiveAccountErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ActiveAccountErrorCopyWithImpl<T, $Res>
    implements $ActiveAccountErrorCopyWith<T, $Res> {
  _$ActiveAccountErrorCopyWithImpl(this._self, this._then);

  final ActiveAccountError<T> _self;
  final $Res Function(ActiveAccountError<T>) _then;

  /// Create a copy of VerificationAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ActiveAccountError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
