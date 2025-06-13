import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';

// repository 호출단
class EventScreenUseCaseMock {
  Future<HttpResponse<List<EventBannerResDto>>> getEventList(
    int page,
    Map<String, dynamic>? options,
  ) async {
    // 1. Mock 데이터 생성
    final mockData = [
      EventBannerResDto.fromJson({
        'id': 1,
        'title': '이벤트 1',
        'imageUrl': 'https://example.com/image1.png',
        'linkUrl': 'https://example.com/event1',
      }),
      EventBannerResDto.fromJson({
        'id': 2,
        'title': '이벤트 2',
        'imageUrl': 'https://example.com/image2.png',
        'linkUrl': 'https://example.com/event2',
      }),
      EventBannerResDto.fromJson({
        'id': 3,
        'title': '이벤트 3',
        'imageUrl': 'https://example.com/image2.png',
        'linkUrl': 'https://example.com/event2',
      }),
      EventBannerResDto.fromJson({
        'id': 4,
        'title': '이벤트 4',
        'imageUrl': 'https://example.com/image2.png',
        'linkUrl': 'https://example.com/event2',
      }),
    ];

    // 2. Mock 응답
    // 2. Mock 응답(Response 객체)
    final response = Response<List<EventBannerResDto>>(
      data: mockData,
      statusCode: 200,
      requestOptions: RequestOptions(
        path: '/mock/event/list',
      ),
    );

    // 3. HttpResponse로 감싸서
    return HttpResponse(response.data!, response);
  }
}
