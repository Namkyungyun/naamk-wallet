import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naamk_wallet/core/remote/config/dio_config.dart';
import 'package:naamk_wallet/core/remote/usecases/event_usecases.dart';
import 'package:naamk_wallet/core/remote/events/repository/event_screen_repository.dart';
import 'package:naamk_wallet/core/remote/events/repository/event_screen_repository_mock.dart';

import 'injector.dart';

Future<void> registerRemoteModule() async {
  await registerNetworkConfig();
  await registerEventAPI();
}

Future<void> registerNetworkConfig() async {
  await dotenv.load(fileName: ".env"); // dotenv 초기화
  injector
      .registerSingleton<Dio>(DioConfig(dotenv.env['API_BASE_URL']!).create());
}

Future<void> registerEventAPI() async {
  /// event screen (repository > useCase > api > domain)
  ///
  // service
  injector.registerSingleton<EventScreenRepository>(
      EventScreenRepository(injector<Dio>()));
  injector.registerSingleton<EventScreenRepositoryMock>(
      EventScreenRepositoryMock());

  // usecase
  injector.registerSingleton<EventUsecases>(EventUsecases(
      injector<EventScreenRepository>(),
      injector<EventScreenRepositoryMock>()));
}
