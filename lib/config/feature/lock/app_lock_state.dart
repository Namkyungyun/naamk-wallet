import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/feature/lock/app_lock_type.dart';

part 'app_lock_state.freezed.dart';

@freezed
class AppLock with _$AppLock {
  const factory AppLock({
    @Default(AppLockMode.none) lockMode,
    @Default(AppLockStatus.unlocked) lockStatus,
  }) = _AppLock;
}
