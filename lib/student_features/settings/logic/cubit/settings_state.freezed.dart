// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>()';
  }
}

/// @nodoc
class $SettingsStateCopyWith<T, $Res> {
  $SettingsStateCopyWith(
      SettingsState<T> _, $Res Function(SettingsState<T>) __);
}

/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns<T> on SettingsState<T> {
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
    TResult Function(LoadingsettingsPage<T> value)? loadingsettingsPage,
    TResult Function(LoadedSettingsPage<T> value)? loadedSettingsPage,
    TResult Function(LoadingSettingsPageError<T> value)?
        loadingSettingsPageError,
    TResult Function(ChangeLanguageSuccess<T> value)? changeLanguageSuccess,
    TResult Function(ChangeUserInfoLoading<T> value)? changeUserInfoLoading,
    TResult Function(ChangeUserInfoSuccess<T> value)? changeUserInfoSuccess,
    TResult Function(ChangeUserInfoError<T> value)? changeUserInfoError,
    TResult Function(LogoutLoading<T> value)? logoutLoading,
    TResult Function(LogoutSuccess<T> value)? logoutSuccess,
    TResult Function(LogoutError<T> value)? logoutError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case LoadingsettingsPage() when loadingsettingsPage != null:
        return loadingsettingsPage(_that);
      case LoadedSettingsPage() when loadedSettingsPage != null:
        return loadedSettingsPage(_that);
      case LoadingSettingsPageError() when loadingSettingsPageError != null:
        return loadingSettingsPageError(_that);
      case ChangeLanguageSuccess() when changeLanguageSuccess != null:
        return changeLanguageSuccess(_that);
      case ChangeUserInfoLoading() when changeUserInfoLoading != null:
        return changeUserInfoLoading(_that);
      case ChangeUserInfoSuccess() when changeUserInfoSuccess != null:
        return changeUserInfoSuccess(_that);
      case ChangeUserInfoError() when changeUserInfoError != null:
        return changeUserInfoError(_that);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading(_that);
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess(_that);
      case LogoutError() when logoutError != null:
        return logoutError(_that);
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
    required TResult Function(LoadingsettingsPage<T> value) loadingsettingsPage,
    required TResult Function(LoadedSettingsPage<T> value) loadedSettingsPage,
    required TResult Function(LoadingSettingsPageError<T> value)
        loadingSettingsPageError,
    required TResult Function(ChangeLanguageSuccess<T> value)
        changeLanguageSuccess,
    required TResult Function(ChangeUserInfoLoading<T> value)
        changeUserInfoLoading,
    required TResult Function(ChangeUserInfoSuccess<T> value)
        changeUserInfoSuccess,
    required TResult Function(ChangeUserInfoError<T> value) changeUserInfoError,
    required TResult Function(LogoutLoading<T> value) logoutLoading,
    required TResult Function(LogoutSuccess<T> value) logoutSuccess,
    required TResult Function(LogoutError<T> value) logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case LoadingsettingsPage():
        return loadingsettingsPage(_that);
      case LoadedSettingsPage():
        return loadedSettingsPage(_that);
      case LoadingSettingsPageError():
        return loadingSettingsPageError(_that);
      case ChangeLanguageSuccess():
        return changeLanguageSuccess(_that);
      case ChangeUserInfoLoading():
        return changeUserInfoLoading(_that);
      case ChangeUserInfoSuccess():
        return changeUserInfoSuccess(_that);
      case ChangeUserInfoError():
        return changeUserInfoError(_that);
      case LogoutLoading():
        return logoutLoading(_that);
      case LogoutSuccess():
        return logoutSuccess(_that);
      case LogoutError():
        return logoutError(_that);
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
    TResult? Function(LoadingsettingsPage<T> value)? loadingsettingsPage,
    TResult? Function(LoadedSettingsPage<T> value)? loadedSettingsPage,
    TResult? Function(LoadingSettingsPageError<T> value)?
        loadingSettingsPageError,
    TResult? Function(ChangeLanguageSuccess<T> value)? changeLanguageSuccess,
    TResult? Function(ChangeUserInfoLoading<T> value)? changeUserInfoLoading,
    TResult? Function(ChangeUserInfoSuccess<T> value)? changeUserInfoSuccess,
    TResult? Function(ChangeUserInfoError<T> value)? changeUserInfoError,
    TResult? Function(LogoutLoading<T> value)? logoutLoading,
    TResult? Function(LogoutSuccess<T> value)? logoutSuccess,
    TResult? Function(LogoutError<T> value)? logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case LoadingsettingsPage() when loadingsettingsPage != null:
        return loadingsettingsPage(_that);
      case LoadedSettingsPage() when loadedSettingsPage != null:
        return loadedSettingsPage(_that);
      case LoadingSettingsPageError() when loadingSettingsPageError != null:
        return loadingSettingsPageError(_that);
      case ChangeLanguageSuccess() when changeLanguageSuccess != null:
        return changeLanguageSuccess(_that);
      case ChangeUserInfoLoading() when changeUserInfoLoading != null:
        return changeUserInfoLoading(_that);
      case ChangeUserInfoSuccess() when changeUserInfoSuccess != null:
        return changeUserInfoSuccess(_that);
      case ChangeUserInfoError() when changeUserInfoError != null:
        return changeUserInfoError(_that);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading(_that);
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess(_that);
      case LogoutError() when logoutError != null:
        return logoutError(_that);
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
    TResult Function()? loadingsettingsPage,
    TResult Function(ProfileAccountModel profileInfo)? loadedSettingsPage,
    TResult Function(String error)? loadingSettingsPageError,
    TResult Function(String language)? changeLanguageSuccess,
    TResult Function()? changeUserInfoLoading,
    TResult Function()? changeUserInfoSuccess,
    TResult Function(String error)? changeUserInfoError,
    TResult Function()? logoutLoading,
    TResult Function()? logoutSuccess,
    TResult Function(String error)? logoutError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case LoadingsettingsPage() when loadingsettingsPage != null:
        return loadingsettingsPage();
      case LoadedSettingsPage() when loadedSettingsPage != null:
        return loadedSettingsPage(_that.profileInfo);
      case LoadingSettingsPageError() when loadingSettingsPageError != null:
        return loadingSettingsPageError(_that.error);
      case ChangeLanguageSuccess() when changeLanguageSuccess != null:
        return changeLanguageSuccess(_that.language);
      case ChangeUserInfoLoading() when changeUserInfoLoading != null:
        return changeUserInfoLoading();
      case ChangeUserInfoSuccess() when changeUserInfoSuccess != null:
        return changeUserInfoSuccess();
      case ChangeUserInfoError() when changeUserInfoError != null:
        return changeUserInfoError(_that.error);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading();
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess();
      case LogoutError() when logoutError != null:
        return logoutError(_that.error);
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
    required TResult Function() loadingsettingsPage,
    required TResult Function(ProfileAccountModel profileInfo)
        loadedSettingsPage,
    required TResult Function(String error) loadingSettingsPageError,
    required TResult Function(String language) changeLanguageSuccess,
    required TResult Function() changeUserInfoLoading,
    required TResult Function() changeUserInfoSuccess,
    required TResult Function(String error) changeUserInfoError,
    required TResult Function() logoutLoading,
    required TResult Function() logoutSuccess,
    required TResult Function(String error) logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case LoadingsettingsPage():
        return loadingsettingsPage();
      case LoadedSettingsPage():
        return loadedSettingsPage(_that.profileInfo);
      case LoadingSettingsPageError():
        return loadingSettingsPageError(_that.error);
      case ChangeLanguageSuccess():
        return changeLanguageSuccess(_that.language);
      case ChangeUserInfoLoading():
        return changeUserInfoLoading();
      case ChangeUserInfoSuccess():
        return changeUserInfoSuccess();
      case ChangeUserInfoError():
        return changeUserInfoError(_that.error);
      case LogoutLoading():
        return logoutLoading();
      case LogoutSuccess():
        return logoutSuccess();
      case LogoutError():
        return logoutError(_that.error);
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
    TResult? Function()? loadingsettingsPage,
    TResult? Function(ProfileAccountModel profileInfo)? loadedSettingsPage,
    TResult? Function(String error)? loadingSettingsPageError,
    TResult? Function(String language)? changeLanguageSuccess,
    TResult? Function()? changeUserInfoLoading,
    TResult? Function()? changeUserInfoSuccess,
    TResult? Function(String error)? changeUserInfoError,
    TResult? Function()? logoutLoading,
    TResult? Function()? logoutSuccess,
    TResult? Function(String error)? logoutError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case LoadingsettingsPage() when loadingsettingsPage != null:
        return loadingsettingsPage();
      case LoadedSettingsPage() when loadedSettingsPage != null:
        return loadedSettingsPage(_that.profileInfo);
      case LoadingSettingsPageError() when loadingSettingsPageError != null:
        return loadingSettingsPageError(_that.error);
      case ChangeLanguageSuccess() when changeLanguageSuccess != null:
        return changeLanguageSuccess(_that.language);
      case ChangeUserInfoLoading() when changeUserInfoLoading != null:
        return changeUserInfoLoading();
      case ChangeUserInfoSuccess() when changeUserInfoSuccess != null:
        return changeUserInfoSuccess();
      case ChangeUserInfoError() when changeUserInfoError != null:
        return changeUserInfoError(_that.error);
      case LogoutLoading() when logoutLoading != null:
        return logoutLoading();
      case LogoutSuccess() when logoutSuccess != null:
        return logoutSuccess();
      case LogoutError() when logoutError != null:
        return logoutError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements SettingsState<T> {
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
    return 'SettingsState<$T>.initial()';
  }
}

/// @nodoc

class LoadingsettingsPage<T> implements SettingsState<T> {
  const LoadingsettingsPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingsettingsPage<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>.loadingsettingsPage()';
  }
}

/// @nodoc

class LoadedSettingsPage<T> implements SettingsState<T> {
  const LoadedSettingsPage({required this.profileInfo});

  final ProfileAccountModel profileInfo;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedSettingsPageCopyWith<T, LoadedSettingsPage<T>> get copyWith =>
      _$LoadedSettingsPageCopyWithImpl<T, LoadedSettingsPage<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedSettingsPage<T> &&
            (identical(other.profileInfo, profileInfo) ||
                other.profileInfo == profileInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileInfo);

  @override
  String toString() {
    return 'SettingsState<$T>.loadedSettingsPage(profileInfo: $profileInfo)';
  }
}

/// @nodoc
abstract mixin class $LoadedSettingsPageCopyWith<T, $Res>
    implements $SettingsStateCopyWith<T, $Res> {
  factory $LoadedSettingsPageCopyWith(LoadedSettingsPage<T> value,
          $Res Function(LoadedSettingsPage<T>) _then) =
      _$LoadedSettingsPageCopyWithImpl;
  @useResult
  $Res call({ProfileAccountModel profileInfo});
}

/// @nodoc
class _$LoadedSettingsPageCopyWithImpl<T, $Res>
    implements $LoadedSettingsPageCopyWith<T, $Res> {
  _$LoadedSettingsPageCopyWithImpl(this._self, this._then);

  final LoadedSettingsPage<T> _self;
  final $Res Function(LoadedSettingsPage<T>) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileInfo = null,
  }) {
    return _then(LoadedSettingsPage<T>(
      profileInfo: null == profileInfo
          ? _self.profileInfo
          : profileInfo // ignore: cast_nullable_to_non_nullable
              as ProfileAccountModel,
    ));
  }
}

/// @nodoc

class LoadingSettingsPageError<T> implements SettingsState<T> {
  const LoadingSettingsPageError({required this.error});

  final String error;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadingSettingsPageErrorCopyWith<T, LoadingSettingsPageError<T>>
      get copyWith => _$LoadingSettingsPageErrorCopyWithImpl<T,
          LoadingSettingsPageError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingSettingsPageError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SettingsState<$T>.loadingSettingsPageError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $LoadingSettingsPageErrorCopyWith<T, $Res>
    implements $SettingsStateCopyWith<T, $Res> {
  factory $LoadingSettingsPageErrorCopyWith(LoadingSettingsPageError<T> value,
          $Res Function(LoadingSettingsPageError<T>) _then) =
      _$LoadingSettingsPageErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$LoadingSettingsPageErrorCopyWithImpl<T, $Res>
    implements $LoadingSettingsPageErrorCopyWith<T, $Res> {
  _$LoadingSettingsPageErrorCopyWithImpl(this._self, this._then);

  final LoadingSettingsPageError<T> _self;
  final $Res Function(LoadingSettingsPageError<T>) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(LoadingSettingsPageError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ChangeLanguageSuccess<T> implements SettingsState<T> {
  const ChangeLanguageSuccess({required this.language});

  final String language;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeLanguageSuccessCopyWith<T, ChangeLanguageSuccess<T>> get copyWith =>
      _$ChangeLanguageSuccessCopyWithImpl<T, ChangeLanguageSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeLanguageSuccess<T> &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'SettingsState<$T>.changeLanguageSuccess(language: $language)';
  }
}

/// @nodoc
abstract mixin class $ChangeLanguageSuccessCopyWith<T, $Res>
    implements $SettingsStateCopyWith<T, $Res> {
  factory $ChangeLanguageSuccessCopyWith(ChangeLanguageSuccess<T> value,
          $Res Function(ChangeLanguageSuccess<T>) _then) =
      _$ChangeLanguageSuccessCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$ChangeLanguageSuccessCopyWithImpl<T, $Res>
    implements $ChangeLanguageSuccessCopyWith<T, $Res> {
  _$ChangeLanguageSuccessCopyWithImpl(this._self, this._then);

  final ChangeLanguageSuccess<T> _self;
  final $Res Function(ChangeLanguageSuccess<T>) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(ChangeLanguageSuccess<T>(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ChangeUserInfoLoading<T> implements SettingsState<T> {
  const ChangeUserInfoLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChangeUserInfoLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>.changeUserInfoLoading()';
  }
}

/// @nodoc

class ChangeUserInfoSuccess<T> implements SettingsState<T> {
  const ChangeUserInfoSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChangeUserInfoSuccess<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>.changeUserInfoSuccess()';
  }
}

/// @nodoc

class ChangeUserInfoError<T> implements SettingsState<T> {
  const ChangeUserInfoError({required this.error});

  final String error;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeUserInfoErrorCopyWith<T, ChangeUserInfoError<T>> get copyWith =>
      _$ChangeUserInfoErrorCopyWithImpl<T, ChangeUserInfoError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeUserInfoError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SettingsState<$T>.changeUserInfoError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ChangeUserInfoErrorCopyWith<T, $Res>
    implements $SettingsStateCopyWith<T, $Res> {
  factory $ChangeUserInfoErrorCopyWith(ChangeUserInfoError<T> value,
          $Res Function(ChangeUserInfoError<T>) _then) =
      _$ChangeUserInfoErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ChangeUserInfoErrorCopyWithImpl<T, $Res>
    implements $ChangeUserInfoErrorCopyWith<T, $Res> {
  _$ChangeUserInfoErrorCopyWithImpl(this._self, this._then);

  final ChangeUserInfoError<T> _self;
  final $Res Function(ChangeUserInfoError<T>) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ChangeUserInfoError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LogoutLoading<T> implements SettingsState<T> {
  const LogoutLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>.logoutLoading()';
  }
}

/// @nodoc

class LogoutSuccess<T> implements SettingsState<T> {
  const LogoutSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LogoutSuccess<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState<$T>.logoutSuccess()';
  }
}

/// @nodoc

class LogoutError<T> implements SettingsState<T> {
  const LogoutError({required this.error});

  final String error;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LogoutErrorCopyWith<T, LogoutError<T>> get copyWith =>
      _$LogoutErrorCopyWithImpl<T, LogoutError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LogoutError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SettingsState<$T>.logoutError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $LogoutErrorCopyWith<T, $Res>
    implements $SettingsStateCopyWith<T, $Res> {
  factory $LogoutErrorCopyWith(
          LogoutError<T> value, $Res Function(LogoutError<T>) _then) =
      _$LogoutErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$LogoutErrorCopyWithImpl<T, $Res>
    implements $LogoutErrorCopyWith<T, $Res> {
  _$LogoutErrorCopyWithImpl(this._self, this._then);

  final LogoutError<T> _self;
  final $Res Function(LogoutError<T>) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(LogoutError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
