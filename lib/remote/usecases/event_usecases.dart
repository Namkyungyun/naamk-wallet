import 'package:naamk_wallet/remote/events/repository/event_screen_repository.dart';
import 'package:naamk_wallet/remote/events/repository/event_screen_repository_mock.dart';
import 'package:naamk_wallet/remote/events/usecase/get_event_list.dart';

// api 최초 호출 파트 (ui 이벤트를 받는 파트)
class EventUsecases {
  final GetEventList getEventList;

  EventUsecases(EventScreenRepository repository,
      EventScreenRepositoryMock repositoryMock)
      : getEventList = GetEventList(repository, repositoryMock);
}
