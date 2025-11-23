

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(bool isStudent) = Success;

  const factory LoginState.error({required String error}) = Error;

  const factory LoginState.googleLoginSuccess(T user) = GoogleLoginSuccess;

  const factory LoginState.googleLoginError({required String error}) = GoogleLoginError;

  const factory LoginState.googleLoginLoading() = GoogleLoginLoading;
}
