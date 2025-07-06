import 'dart:developer';

import 'package:e_learning_app/features/authVerification/data/model/active_account_response_body.dart';
import 'package:e_learning_app/features/authVerification/data/repo/active_account_repo.dart';
import 'package:e_learning_app/core/networking/api_result.dart' as api_result;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/model/active_account_request_body.dart';
import 'verification_account_state.dart';

class VerificationAccountCubit extends Cubit<VerificationAccountState> {
  final ActiveAccountRepo activeAccountRepo;
  VerificationAccountCubit(this.activeAccountRepo)
      : super(VerificationAccountState.initial());

  final formKey = GlobalKey<FormState>();
  final otpController = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());
  final String otpCode = '';

  void activeAccount(ActiveAccountRequestBody activeAccountRequestBody) async {
    emit(VerificationAccountState.activeAccountLoading());
    log(activeAccountRequestBody.toJson().toString());
    try {
      final response =
          await activeAccountRepo.acctiveAccount(activeAccountRequestBody);
      // log(response.toString());
      // emit(VerificationAccountState.activeAccountSuccess(response));
      if (response is api_result.Success<ActiveAccountResponseBody>) {
        emit(
          VerificationAccountState.activeAccountSuccess({
            'statusCode': response.data.statusCode,
            'message': response.data.message,
          }),
        );
      } else if (response is api_result.Failure<ActiveAccountResponseBody>) {
        emit(VerificationAccountState.activeAccountError(
            error: response.error.apiErrorModel.message ?? "Unknown Error"));
      }
    } catch (error) {
      if (error is ErrorHandler) {
        emit(VerificationAccountState.activeAccountError(
            error: error.apiErrorModel.message!));
      } else {
        emit(VerificationAccountState.activeAccountError(
            error: error.toString()));
      }
    }
  }
}
