
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/profile_account_model.dart';



part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.homeScreenLoading() = HomeScreenLoading;
  const factory HomeState.homeScreenLoaded(
      {required ProfileAccountModel profileData}) = HomeScreenLoaded;
  const factory HomeState.homeScreenLoadedError({required String error}) =
      HomeScreenLoadedError;
}
