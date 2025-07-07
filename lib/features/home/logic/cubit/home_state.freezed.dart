// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>()';
  }
}

/// @nodoc
class $HomeStateCopyWith<T, $Res> {
  $HomeStateCopyWith(HomeState<T> _, $Res Function(HomeState<T>) __);
}

/// @nodoc

class _Initial<T> implements HomeState<T> {
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
    return 'HomeState<$T>.initial()';
  }
}

/// @nodoc

class HomeScreenLoading<T> implements HomeState<T> {
  const HomeScreenLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeScreenLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoading()';
  }
}

/// @nodoc

class HomeScreenLoaded<T> implements HomeState<T> {
  const HomeScreenLoaded({required this.profileData});

  final ProfileAccountModel profileData;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeScreenLoadedCopyWith<T, HomeScreenLoaded<T>> get copyWith =>
      _$HomeScreenLoadedCopyWithImpl<T, HomeScreenLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeScreenLoaded<T> &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileData);

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoaded(profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $HomeScreenLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeScreenLoadedCopyWith(
          HomeScreenLoaded<T> value, $Res Function(HomeScreenLoaded<T>) _then) =
      _$HomeScreenLoadedCopyWithImpl;
  @useResult
  $Res call({ProfileAccountModel profileData});
}

/// @nodoc
class _$HomeScreenLoadedCopyWithImpl<T, $Res>
    implements $HomeScreenLoadedCopyWith<T, $Res> {
  _$HomeScreenLoadedCopyWithImpl(this._self, this._then);

  final HomeScreenLoaded<T> _self;
  final $Res Function(HomeScreenLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileData = null,
  }) {
    return _then(HomeScreenLoaded<T>(
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileAccountModel,
    ));
  }
}

/// @nodoc

class HomeScreenLoadedError<T> implements HomeState<T> {
  const HomeScreenLoadedError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeScreenLoadedErrorCopyWith<T, HomeScreenLoadedError<T>> get copyWith =>
      _$HomeScreenLoadedErrorCopyWithImpl<T, HomeScreenLoadedError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeScreenLoadedError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $HomeScreenLoadedErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeScreenLoadedErrorCopyWith(HomeScreenLoadedError<T> value,
          $Res Function(HomeScreenLoadedError<T>) _then) =
      _$HomeScreenLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$HomeScreenLoadedErrorCopyWithImpl<T, $Res>
    implements $HomeScreenLoadedErrorCopyWith<T, $Res> {
  _$HomeScreenLoadedErrorCopyWithImpl(this._self, this._then);

  final HomeScreenLoadedError<T> _self;
  final $Res Function(HomeScreenLoadedError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(HomeScreenLoadedError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
