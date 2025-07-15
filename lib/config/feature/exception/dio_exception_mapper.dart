import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/feature/exception/dio_exception.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_type.dart';

class DioExceptionMapper {
  AppExceptionState exceptionWithStatusCode(int? statusCode) {
    final CustomDioException exception =
        CustomDioException.fromHttpStatusCode(statusCode);

    return AppExceptionState(
      code: exception.appExceptionType?.statusCode,
      message: exception.appExceptionType?.message,
      detailMessage: exception.detailMessage,
    );
  }

  AppExceptionState exceptionWithDioException(DioException e) {
    final CustomDioException exception = CustomDioException.fromDioError(e);

    if (kDebugMode) {
      GlobalLogger.error(exception.toString());
    }

    return AppExceptionState(
      code: exception.appExceptionType?.statusCode,
      message: exception.appExceptionType?.message,
      detailMessage: exception.detailMessage,
    );
  }

  AppExceptionState exceptionWithUnkown(dynamic e) {
    if (kDebugMode) {
      GlobalLogger.error(e);
    }

    const AppExceptionType unknownError = AppExceptionType.unknownError;
    return AppExceptionState(
      code: unknownError.statusCode,
      message: unknownError.message,
      detailMessage: '$e',
    );
  }
}
