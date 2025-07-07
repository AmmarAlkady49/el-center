import 'dart:developer';

import 'package:e_learning_app/core/data/repo/profile_repo.dart';
import 'package:e_learning_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_learning_app/core/networking/api_result.dart' as api_result;

import '../../../../core/data/models/profile_account_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepo profileRepo;
  HomeCubit(this.profileRepo) : super(HomeState.initial());

  void getAppBarData() async {
    emit(HomeState.homeScreenLoading());
    try {
      final result = await profileRepo.getProfile();
      log(result.toString());

      if (result is api_result.Success<ProfileAccountModel>) {
        emit(HomeState.homeScreenLoaded(profileData: result.data));
      }
      else if (result is api_result.Failure<ProfileAccountModel>) {
        emit(HomeState.homeScreenLoadedError(error: result.error.apiErrorModel.message!));
      }
    } catch (error) {
      log(error.toString());
      emit(HomeState.homeScreenLoadedError(error: error.toString()));
    }
  }
}
