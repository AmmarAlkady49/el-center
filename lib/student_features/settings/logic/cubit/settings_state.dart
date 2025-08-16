import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/profile_account_model.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState<T> with _$SettingsState<T> {
  const factory SettingsState.initial() = _Initial;

  const factory SettingsState.loadingsettingsPage() = LoadingsettingsPage;

  const factory SettingsState.loadedSettingsPage(
      {required ProfileAccountModel profileInfo}) = LoadedSettingsPage;

  const factory SettingsState.loadingSettingsPageError(
      {required String error}) = LoadingSettingsPageError;

  const factory SettingsState.changeLanguageSuccess(
      {required String language}) = ChangeLanguageSuccess;

  const factory SettingsState.changeUserInfoLoading() = ChangeUserInfoLoading;

  const factory SettingsState.changeUserInfoSuccess() = ChangeUserInfoSuccess;

  const factory SettingsState.changeUserInfoError({required String error}) =
      ChangeUserInfoError;
}
