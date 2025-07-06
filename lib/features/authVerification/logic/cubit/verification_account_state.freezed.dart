// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
