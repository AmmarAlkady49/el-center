import 'package:e_learning_app/student_features/payment/data/repo/payment_repo.dart';
import 'package:e_learning_app/student_features/payment/logic/cubit/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentCubit(this.paymentRepo) : super(PaymentState.initial());

  // Future<void> emitPaymentState(int courseID, String paymentMethod) async {
  //   emit(PaymentState.paymentLoading());
  //   final result =
  //       await paymentRepo.createPaymentToken(courseID, paymentMethod);
  //   log(result.toString());
  //   if (result is Success<Map<String, String>>) {
  //     emit(PaymentState.paymentSuccess(result.data));
  //   } else {
  //     emit(PaymentState.paymentFailure(error: result.toString()));
  //   }
  // }
}
