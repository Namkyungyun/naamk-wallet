import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_version_state.g.dart';
part 'app_version_state.freezed.dart';

@freezed
class AppVersionState with _$AppVersionState {
  const factory AppVersionState({
    @Default('') String os,
    @Default('') String version,
    @Default(false) bool isForce,
  }) = _AppVersionState;

  factory AppVersionState.fromJson(Map<String, dynamic> json) =>
      _$AppVersionStateFromJson(json);
}
