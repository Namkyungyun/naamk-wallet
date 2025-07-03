enum AppLockType {
  unlocked, // 기본 상태
  lockedRequired, // 잠금이 필요함 (앱이 백그라운드 -> 포그라운드 복귀 등)
  locking, // 현재 잠금화면에서 인증 중
  unlockedByAuth, // 인증 성공 후 해제됨.
  unlockFailed, // 인증 실패
  bypassed, // 테스트 목적 등으로 잠금 우회됨.
}
