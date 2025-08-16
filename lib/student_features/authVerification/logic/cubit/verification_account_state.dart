import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_account_state.freezed.dart';

@freezed
class VerificationAccountState<T> with _$VerificationAccountState<T> {
  const factory VerificationAccountState.initial() = _Initial;

  const factory VerificationAccountState.activeAccountLoading() =
      ActiveAccountLoading;
  const factory VerificationAccountState.activeAccountSuccess(T data) =
      ActiveAccountSuccess<T>;
  const factory VerificationAccountState.activeAccountError(
      {required String error}) = ActiveAccountError;
}
