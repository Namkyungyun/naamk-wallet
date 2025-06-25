import 'package:get_it/get_it.dart';
import 'package:naamk_wallet/config/di/inject_listener_module.dart';
import 'package:naamk_wallet/config/di/inject_local_module.dart';
import 'package:naamk_wallet/config/di/inject_remote_module.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // data - local
  await registerLocalModule();

  // data - remote
  await registerRemoteModule();

  // listener
  await registerListenerModule();
}
