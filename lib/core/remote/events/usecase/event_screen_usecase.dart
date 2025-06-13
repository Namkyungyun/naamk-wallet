import 'package:retrofit/retrofit.dart';

import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';
import 'package:naamk_wallet/core/remote/events/repository/event_screen_repository.dart';

// repository 호출단
class EventScreenUseCase {
  final EventScreenRepository _eventScreenRepository;

  EventScreenUseCase(this._eventScreenRepository);

  Future<HttpResponse<List<EventBannerResDto>>> getEventList(
    int page,
    Map<String, String>? options,
  ) =>
      _eventScreenRepository.getEventList(page, options);
}
