import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/remote/dio_exception.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_type.dart';

class ApiExceptionMapper {
  AppException exceptionWithStatusCode(int? statusCode) {
    final CustomDioException exception =
        CustomDioException.fromHttpStatusCode(statusCode);

    return AppException(
      code: exception.appExceptionType?.statusCode,
      message: exception.appExceptionType?.message,
      detailMessage: exception.detailMessage,
    );
  }

  AppException exceptionWithDioException(DioException e) {
    final CustomDioException exception = CustomDioException.fromDioError(e);

    if (kDebugMode) {
      GlobalLogger.error(exception.toString());
    }

    return AppException(
      code: exception.appExceptionType?.statusCode,
      message: exception.appExceptionType?.message,
      detailMessage: exception.detailMessage,
    );
  }

  AppException exceptionWithUnkown(dynamic e) {
    if (kDebugMode) {
      GlobalLogger.error(e);
    }

    const AppExceptionType unknownError = AppExceptionType.unknownError;
    return AppException(
      code: unknownError.statusCode,
      message: unknownError.message,
      detailMessage: '$e',
    );
  }
}
