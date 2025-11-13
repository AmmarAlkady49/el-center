import 'dart:developer';

import 'package:e_learning_app/core/data/models/update_profile_model.dart';
import 'package:e_learning_app/core/helpers/shared_pref_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

import '../../data/repo/settings_repo.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo settingsRepo;
  SettingsCubit(this.settingsRepo) : super(SettingsState.initial());

  String? selectedLanguage;
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController dateOfBirthController;
  late TextEditingController bioController;
  late TextEditingController profilePictureController;
  String selectedGender = 'male';

  void emitSettingsPage() async {
    emit(SettingsState.loadingsettingsPage());
    try {
      final response = await settingsRepo.getProfile();
      fNameController = TextEditingController(text: response.firstName);
      lNameController = TextEditingController(text: response.lastName);
      emailController = TextEditingController(text: response.email);
      phoneController = TextEditingController(text: response.phoneNumber);
      dateOfBirthController = TextEditingController(text: response.dateOfBirth);
      bioController = TextEditingController(text: response.bio);
      profilePictureController =
          TextEditingController(text: response.profilePicture);
      selectedGender = response.gender;
      log('Response: $response');
      emit(SettingsState.loadedSettingsPage(profileInfo: response));
    } catch (e) {
      log('Error: $e');
      emit(SettingsState.loadingSettingsPageError(error: e.toString()));
    }
  }

  // change user info
  void updateProfile(UpdateProfileModel profileInfo) async {
    emit(SettingsState.changeUserInfoLoading());
    try {
      await settingsRepo.updateProfile(profileInfo);
      emit(SettingsState.changeUserInfoSuccess());
    } catch (e) {
      log('Error changing user info: $e');
      emit(SettingsState.changeUserInfoError(error: e.toString()));
    }
  }

  // change language
  void changeLanguage(String languageCode) async {
    try {
      await SharedPrefHelper.setData("language_code", languageCode);
      emit(SettingsState.changeLanguageSuccess(language: languageCode));
      Restart.restartApp();
      log('Saved language code: ${await SharedPrefHelper.getString("language_code")}');
    } catch (e) {
      log('Error changing language: $e');
    }
  }

  Future<void> loadSavedLanguage() async {
    try {
      final fetchedLang = await SharedPrefHelper.getString("language_code");
      final languageCode =
          (fetchedLang != null && fetchedLang.isNotEmpty) ? fetchedLang : 'en';
      selectedLanguage = languageCode;

      emit(SettingsState.changeLanguageSuccess(language: languageCode));
      log('Loaded saved language3 after success: $languageCode');
    } catch (e) {
      log('Error loading saved language: $e');
      selectedLanguage = 'en';
      emit(SettingsState.changeLanguageSuccess(language: 'en'));
    }
  }

  Future<void> logout() async {
    emit(SettingsState.logoutLoading());
    try {
      await settingsRepo.logout();
      emit(SettingsState.logoutSuccess());
      // SharedPrefHelper.clearAllData();
      SharedPrefHelper.removeData("userType");
      SharedPrefHelper.removeData("userId");

      SharedPrefHelper.clearAllSecuredData();
    } catch (e) {
      log('Error during logout: $e');
      emit(SettingsState.logoutError(error: e.toString()));
    }
  }
}
