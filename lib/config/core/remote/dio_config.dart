import 'package:dio/dio.dart';
import 'package:naamk_wallet/config/core/remote/interceptor/logging_interceptor.dart';

class DioConfig {
  final String _baseUrl;

  DioConfig(this._baseUrl);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
      );

  Dio create() => Dio(_createBaseOptions())
    ..interceptors.addAll([
      LoggerInterceptor(),
    ]);
}
