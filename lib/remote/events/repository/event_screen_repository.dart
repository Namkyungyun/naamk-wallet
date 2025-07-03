import 'package:dio/dio.dart';
import 'package:naamk_wallet/remote/events/states/feature_state/list_state.dart';
import 'package:retrofit/retrofit.dart';

part 'event_screen_repository.g.dart';

// retrofit 사용처 (실질적 api 통신 파트)
@RestApi()
abstract class EventScreenRepository {
  factory EventScreenRepository(Dio dio) = _EventScreenRepository;

  @GET("/events")
  Future<HttpResponse<EventListState>> getEventList(
    @Queries() Map<String, String>? req,
  );
}
