import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';

class PaymentRepo {
  final ApiService apiService;
  PaymentRepo(this.apiService);

  Future<ApiResult<Map<String, String>>> createPaymentToken(
      int courseID, String paymentMethod, String? couponCode) async {
    try {
      final response =
          await apiService.createPaymentToken(courseID, paymentMethod, couponCode);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
