import 'package:get_it/get_it.dart';
import 'package:naamk_wallet/config/di/inject_local_module.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // network

  // data - local
  await registerLocalModule();

  // data - remote
}
