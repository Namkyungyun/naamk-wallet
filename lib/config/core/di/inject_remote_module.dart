import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naamk_wallet/config/core/remote/dio_config.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository_mock.dart';
import 'package:naamk_wallet/remote/usecases/event_usecases.dart';
import 'package:naamk_wallet/remote/events/repository/event_screen_repository.dart';
import 'package:naamk_wallet/remote/events/repository/event_screen_repository_mock.dart';
import 'package:naamk_wallet/remote/usecases/system_usecases.dart';

import 'injector.dart';

Future<void> registerRemoteModule() async {
  await registerNetworkConfig();
  await registerSystemAPI();
  await registerEventAPI();
}

Future<void> registerNetworkConfig() async {
  await dotenv.load(fileName: ".env"); // dotenv 초기화
  injector
      .registerSingleton<Dio>(DioConfig(dotenv.env['API_BASE_URL']!).create());
}

Future<void> registerSystemAPI() async {
  /// system app check
  ///
  /// repository
  injector
      .registerSingleton<SystemRepository>(SystemRepository(injector<Dio>()));
  injector.registerSingleton<SystemRepositoryMock>(SystemRepositoryMock());

  /// usecase
  injector.registerSingleton<SystemUsecases>(SystemUsecases(
    injector<SystemRepository>(),
    injector<SystemRepositoryMock>(),
  ));
}

Future<void> registerEventAPI() async {
  /// event screen (repository > useCase > api > domain)
  ///
  // repository
  injector.registerSingleton<EventScreenRepository>(
      EventScreenRepository(injector<Dio>()));
  injector.registerSingleton<EventScreenRepositoryMock>(
      EventScreenRepositoryMock());

  // usecase
  injector.registerSingleton<EventUsecases>(EventUsecases(
    injector<EventScreenRepository>(),
    injector<EventScreenRepositoryMock>(),
  ));
}
