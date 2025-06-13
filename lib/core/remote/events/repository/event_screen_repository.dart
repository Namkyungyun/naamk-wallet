import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';

part 'event_screen_repository.g.dart';

// retrofit 사용처 (실질적 api 통신 파트)
@RestApi()
abstract class EventScreenRepository {
  factory EventScreenRepository(Dio dio) = _EventScreenRepository;

  @GET("/events")
  Future<HttpResponse<List<EventBannerResDto>>> getEventList(
    @Query("page") int page,
    @Queries() Map<String, String>? options,
  );
}
