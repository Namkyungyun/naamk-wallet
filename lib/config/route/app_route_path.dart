enum AppRoute {
  home,
  wallet,
  notice,
  community,
  settings,
  ;

  String get route => '/${toString().replaceAll('AppRoute.', '')}';
  String get name => toString().replaceAll('AppRoute.', '');
}
