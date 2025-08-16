
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;

  const factory PaymentState.paymentLoading() = PaymentLoading;

  const factory PaymentState.paymentSuccess(Map<String, String> redirectData) = PaymentSuccess;

  const factory PaymentState.paymentFailure({required String error}) = PaymentFailure;
}
