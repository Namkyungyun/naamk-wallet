import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_maintenance_state.g.dart';
part 'app_maintenance_state.freezed.dart';

@freezed
class AppMaintenanceState with _$AppMaintenanceState {
  const factory AppMaintenanceState({@Default(false) bool isMaintenance}) =
      _AppMaintenanceState;

  factory AppMaintenanceState.fromJson(Map<String, dynamic> json) =>
      _$AppMaintenanceStateFromJson(json);
}
