import 'package:dio/dio.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_type.dart';

class CustomDioException implements Exception {
  late AppExceptionType? appExceptionType;
  late String detailMessage;

  CustomDioException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        appExceptionType = null;
        detailMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        appExceptionType = AppExceptionType.timeout;
        detailMessage = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        appExceptionType = AppExceptionType.timeout;
        detailMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        appExceptionType = AppExceptionType.timeout;
        detailMessage = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:
        detailMessage = handleStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          appExceptionType = AppExceptionType.noInternet;
          detailMessage = 'No Internet.';
          break;
        }

        appExceptionType = AppExceptionType.unknownError;
        detailMessage = 'Unexpected error occurred.';
        break;
      default:
        appExceptionType = AppExceptionType.internalServerError;
        detailMessage = 'Something went wrong';
        break;
    }
  }

  CustomDioException.fromHttpStatusCode(int? statusCode) {
    handleStatusCode(statusCode);
  }

  String handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        appExceptionType = AppExceptionType.badRequest;
        return 'Bad request.';
      case 401:
        appExceptionType = AppExceptionType.unAuthorized;
        return 'Authentication failed.';
      case 403:
        appExceptionType = AppExceptionType.forbidden;
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        appExceptionType = AppExceptionType.notFound;
        return 'The requested resource does not exist.';
      case 405:
        appExceptionType = AppExceptionType.methodNotAllowed;
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        appExceptionType = AppExceptionType.unsupportedMediaType;
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        appExceptionType = AppExceptionType.validationFailed;
        return 'Data validation failed.';
      case 429:
        appExceptionType = AppExceptionType.tooManyRequests;
        return 'Too many requests.';
      case 500:
        appExceptionType = AppExceptionType.internalServerError;
        return 'Internal server error.';
      default:
        appExceptionType = AppExceptionType.unknownError;
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => '${appExceptionType?.statusCode} $detailMessage';
}
