// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentState()';
  }
}

/// @nodoc
class $PaymentStateCopyWith<$Res> {
  $PaymentStateCopyWith(PaymentState _, $Res Function(PaymentState) __);
}

/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentFailure value)? paymentFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading(_that);
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentFailure value) paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case PaymentLoading():
        return paymentLoading(_that);
      case PaymentSuccess():
        return paymentSuccess(_that);
      case PaymentFailure():
        return paymentFailure(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentFailure value)? paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading(_that);
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
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
    TResult Function()? paymentLoading,
    TResult Function(Map<String, String> redirectData)? paymentSuccess,
    TResult Function(String error)? paymentFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading();
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that.redirectData);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
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
    required TResult Function() paymentLoading,
    required TResult Function(Map<String, String> redirectData) paymentSuccess,
    required TResult Function(String error) paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case PaymentLoading():
        return paymentLoading();
      case PaymentSuccess():
        return paymentSuccess(_that.redirectData);
      case PaymentFailure():
        return paymentFailure(_that.error);
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
    TResult? Function()? paymentLoading,
    TResult? Function(Map<String, String> redirectData)? paymentSuccess,
    TResult? Function(String error)? paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading();
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that.redirectData);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements PaymentState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentState.initial()';
  }
}

/// @nodoc

class PaymentLoading implements PaymentState {
  const PaymentLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentState.paymentLoading()';
  }
}

/// @nodoc

class PaymentSuccess implements PaymentState {
  const PaymentSuccess(final Map<String, String> redirectData)
      : _redirectData = redirectData;

  final Map<String, String> _redirectData;
  Map<String, String> get redirectData {
    if (_redirectData is EqualUnmodifiableMapView) return _redirectData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_redirectData);
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentSuccessCopyWith<PaymentSuccess> get copyWith =>
      _$PaymentSuccessCopyWithImpl<PaymentSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentSuccess &&
            const DeepCollectionEquality()
                .equals(other._redirectData, _redirectData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_redirectData));

  @override
  String toString() {
    return 'PaymentState.paymentSuccess(redirectData: $redirectData)';
  }
}

/// @nodoc
abstract mixin class $PaymentSuccessCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory $PaymentSuccessCopyWith(
          PaymentSuccess value, $Res Function(PaymentSuccess) _then) =
      _$PaymentSuccessCopyWithImpl;
  @useResult
  $Res call({Map<String, String> redirectData});
}

/// @nodoc
class _$PaymentSuccessCopyWithImpl<$Res>
    implements $PaymentSuccessCopyWith<$Res> {
  _$PaymentSuccessCopyWithImpl(this._self, this._then);

  final PaymentSuccess _self;
  final $Res Function(PaymentSuccess) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? redirectData = null,
  }) {
    return _then(PaymentSuccess(
      null == redirectData
          ? _self._redirectData
          : redirectData // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class PaymentFailure implements PaymentState {
  const PaymentFailure({required this.error});

  final String error;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentFailureCopyWith<PaymentFailure> get copyWith =>
      _$PaymentFailureCopyWithImpl<PaymentFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PaymentState.paymentFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $PaymentFailureCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory $PaymentFailureCopyWith(
          PaymentFailure value, $Res Function(PaymentFailure) _then) =
      _$PaymentFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$PaymentFailureCopyWithImpl<$Res>
    implements $PaymentFailureCopyWith<$Res> {
  _$PaymentFailureCopyWithImpl(this._self, this._then);

  final PaymentFailure _self;
  final $Res Function(PaymentFailure) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(PaymentFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
