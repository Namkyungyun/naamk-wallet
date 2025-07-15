import 'package:dio/dio.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_version_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';
import 'package:retrofit/retrofit.dart';

part 'system_repository.g.dart';

@RestApi()
abstract class SystemRepository {
  factory SystemRepository(Dio dio) = _SystemRepository;

  @GET("/app-maintenance")
  Future<HttpResponse<AppMaintenanceState>> checkAppMaintenance();

  @GET("/app-version")
  Future<HttpResponse<AppVersionState>> getAppVersionInfo();

  @POST("/login-session")
  Future<HttpResponse<LoginSessionState>> getUserLoginSession(
    @Body() Map<String, dynamic> req,
  );
}
