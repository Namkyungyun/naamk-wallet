import 'package:app_links/app_links.dart';

import 'injector.dart';

Future<void> registerListenerModule() async {
  await registerAppLinks();
}

Future<void> registerAppLinks() async {
  try {
    final appLinks = AppLinks();

    injector.registerSingleton<AppLinks>(appLinks);
  } catch (e) {
    print('registerAppLinks ERROR : $e');
  }
}
