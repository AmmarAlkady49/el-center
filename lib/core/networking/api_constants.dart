import 'package:dio/dio.dart';

class ApiConstants {
  static const String apiBaseUrl = "https://elcentre-api.runasp.net/";

  static const String login = "Account/login";
  static const String register = "Account/register";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

abstract class ParseErrorLogger {
  void logError(
      Object error, StackTrace stackTrace, RequestOptions requestOptions);
}
