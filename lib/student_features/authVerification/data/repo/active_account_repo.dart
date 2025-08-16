import 'package:e_learning_app/core/networking/api_error_handler.dart';
import 'package:e_learning_app/core/networking/api_result.dart';
import 'package:e_learning_app/student_features/authVerification/data/model/active_account_request_body.dart';

import '../../../../core/networking/api_service.dart';
import '../model/active_account_response_body.dart';

class ActiveAccountRepo {
  final ApiService _apiService;
  ActiveAccountRepo(this._apiService);
  Future<ApiResult<ActiveAccountResponseBody>> acctiveAccount(
      ActiveAccountRequestBody activeAccountRequestBody) async {
    try {
      final response =
          await _apiService.acctiveAccount(activeAccountRequestBody);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
