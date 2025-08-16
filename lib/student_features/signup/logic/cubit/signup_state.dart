

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';



@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = Success<T>;
  const factory SignupState.error({required String error}) = Error;
  const factory SignupState.copyWith(T data) = CopyWith<T>;

}
