import 'package:dio/dio.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_version_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';
import 'package:retrofit/retrofit.dart';

class SystemRepositoryMock {
  Future<HttpResponse<LoginSessionState>> getUserLoginSession(
    Map<String, dynamic>? req,
  ) async {
    GlobalLogger.info("[API] getLoginSession req :"
        "$req");

    // final Map<String, dynamic> options = req?['options'];

    // if (options == null) {
    //   final response = Response<LoginSessionState>(
    //     data: null,
    //     statusCode: 500,
    //     requestOptions: RequestOptions(path: '/mock/systems/login-session'),
    //   );

    //   return HttpResponse(response.data!, response);
    // }

    // Mock data
    final mockData = userLoginSessionMockData;

    // Mock 응답 (Response 객체)
    final response = Response<LoginSessionState>(
      data: LoginSessionState.fromJson(mockData),
      statusCode: 200,
      requestOptions: RequestOptions(path: '/mock/systems/login-session'),
    );

    // HttpResponse return
    return HttpResponse(response.data!, response);
  }

  Future<HttpResponse<AppMaintenanceState?>> checkAppMaintenance() async {
    GlobalLogger.info("[API] getLoginSession");

    // mock data
    final mockData = appMaintenanceMockData;

    // 500 mock
    // final response = Response<AppMaintenanceState?>(
    //   data: null,
    //   statusCode: 500,
    //   requestOptions: RequestOptions(path: '/mock/systems/maintenance'),
    // );

    // 200 mock response
    final response = Response<AppMaintenanceState>(
      data: AppMaintenanceState.fromJson(mockData),
      statusCode: 200,
      requestOptions: RequestOptions(path: '/mock/systems/maintenance'),
    );

    // HttpResponse
    return HttpResponse(response.data, response);
  }

  Future<HttpResponse<AppVersionState?>> checkAppVersion() async {
    GlobalLogger.info("[API] checkAppForceUpdate");

    // mock data
    final mockData = appVersionMockData;

    // 500 mock
    // final response = Response<AppForceUpdateState?>(
    //   data: null,
    //   statusCode: 500,
    //   requestOptions: RequestOptions(path: '/mock/systems/maintenance'),
    // );

    // 200 mock response
    final response = Response<AppVersionState>(
      data: AppVersionState.fromJson(mockData),
      statusCode: 200,
      requestOptions: RequestOptions(path: '/mock/systems/version'),
    );

    // HttpResponse
    return HttpResponse(response.data, response);
  }
}

final userLoginSessionMockData = {
  'loginId': 'test123',
  'sessionExpired': false,
};

final appMaintenanceMockData = {
  'isMaintenance': false,
};

final appVersionMockData = {
  'os': 'AOS',
  'version': '1.0.0',
  'isForce': false,
};
