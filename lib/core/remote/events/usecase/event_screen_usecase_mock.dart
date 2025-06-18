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
        'imagePath':
            'https://github.com/user-attachments/assets/4439ac76-4eaf-43bb-8863-d214f1d42eb7',
        'linkUrl': '/event/rullet',
        'participated': false,
      }),
      EventBannerResDto.fromJson({
        'id': 2,
        'title': '이벤트-!!',
        'imagePath':
            'https://github.com/user-attachments/assets/e2a42060-9a42-456d-ae19-d36d8af57712',
        'linkUrl': 'https://example.com/event2',
        'participated': false,
      }),
      EventBannerResDto.fromJson({
        'id': 3,
        'title': '이벤트-!!!',
        'imagePath':
            'https://github.com/user-attachments/assets/5ec59646-fe98-4010-8351-16bf3a06dc8a',
        'linkUrl': 'https://example.com/event2',
        'participated': false,
      }),
      EventBannerResDto.fromJson({
        'id': 4,
        'title': '이벤트-!!!!',
        'imagePath':
            'https://github.com/user-attachments/assets/f6ce5aa2-418e-412c-8bc1-9edb7f43592b',
        'linkUrl': 'https://example.com/event2',
        'participated': false,
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
