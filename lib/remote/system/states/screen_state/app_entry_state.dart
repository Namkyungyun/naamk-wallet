import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/app/app_entry_viewmodel.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';

part 'app_entry_state.freezed.dart';

@freezed
class AppEntryState with _$AppEntryState {
  const factory AppEntryState({
    @Default(AppEntryCheckStatus.none) appEntryStatus,
    @Default('') String userLoginSessionReq,
    @Default(ViewState<LoginSessionState>())
    ViewState<LoginSessionState> userLoginSessionRes,
    @Default(ViewState<AppMaintenanceState>())
    ViewState<AppMaintenanceState> appMaintenanceRes,
  }) = _AppEntryState;

  factory AppEntryState.initial() => AppEntryState(
      appEntryStatus: AppEntryCheckStatus.none,
      userLoginSessionReq: '',
      userLoginSessionRes:
          ViewState<LoginSessionState>.empty(const LoginSessionState()),
      appMaintenanceRes:
          ViewState<AppMaintenanceState>.empty(const AppMaintenanceState()));
}
