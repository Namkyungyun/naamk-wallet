import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naamk_wallet/core/remote/config/dio_config.dart';
import 'package:naamk_wallet/core/remote/domain/event_screen_domain.dart';
import 'package:naamk_wallet/core/remote/events/repository/event_screen_repository.dart';
import 'package:naamk_wallet/core/remote/events/usecase/event_screen_usecase.dart';
import 'package:naamk_wallet/core/remote/events/usecase/event_screen_usecase_mock.dart';

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
  // event screen (repository > useCase > api > domain)
  injector.registerSingleton<EventScreenRepository>(
      EventScreenRepository(injector()));

  injector.registerSingleton<EventScreenUseCase>(
      EventScreenUseCase(injector<EventScreenRepository>()));
  injector.registerSingleton<EventScreenUseCaseMock>(EventScreenUseCaseMock());

  injector.registerSingleton<GetEventList>(GetEventList(
      injector<EventScreenUseCase>(), injector<EventScreenUseCaseMock>()));

  injector.registerSingleton<EventScreenDomain>(
      EventScreenDomain(injector<GetEventList>()));
}
