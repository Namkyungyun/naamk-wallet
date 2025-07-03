enum AppGnbRoute {
  home,
  wallet,
  notices,
  community,
  settings,
  events,
  ;

  String get route => '/${toString().replaceAll('AppGnbRoute.', '')}';
  String get name => toString().replaceAll('AppGnbRoute.', '');
}

enum AppRoute {
  settingsTerm('/settings/term'),
  settingsAbout('/settings/about'),

  eventsRullet('/events/rullet'),

  authConfirm('/auth/confirm'),
  authSetupPincode('/auth/setup/pincode'),
  authSetupBiometric('/auth/setup/biometric');

  final String route;
  const AppRoute(this.route);
}
