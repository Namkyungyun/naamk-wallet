import 'package:dio/dio.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/remote/events/dtos/feature_state/daily_list_state.dart';
import 'package:retrofit/retrofit.dart';

// repository 호출단
class EventScreenRepositoryMock {
  Future<HttpResponse<EventListState>> getEventList(
    Map<String, dynamic>? req,
  ) async {
    GlobalLogger.info(req);

    final Map<String, dynamic>? options = req?['options'];
    final String? type = options?['type'];
    if (type == null) {
      final response = Response<EventListState>(
        data: null,
        statusCode: 500,
        requestOptions: RequestOptions(
          path: '/mock/events/list',
        ),
      );

      return HttpResponse(response.data!, response);
    }

    // Mock 데이터
    final mockdata = (type == 'weekly') ? weeklyMockData : dailyMockData;

    // Mock 응답(Response 객체)
    final response = Response<EventListState>(
      data: EventListState.fromJson(mockdata),
      statusCode: 200,
      requestOptions: RequestOptions(
        path: '/mock/events/list',
      ),
    );

    // 3. HttpResponse로 감싸서
    return HttpResponse(response.data!, response);
  }
}

final dailyMockData = {
  'pagination': {
    'page': 1,
    'totalCount': 4,
    'hasMore': false,
  },
  'contents': [
    {
      'id': 1,
      'title': '이벤트 1',
      'imagePath':
          'https://github.com/user-attachments/assets/4439ac76-4eaf-43bb-8863-d214f1d42eb7',
      'linkUrl': '/events/rullet',
      'participated': false,
    },
    {
      'id': 2,
      'title': '이벤트-!!',
      'imagePath':
          'https://github.com/user-attachments/assets/e2a42060-9a42-456d-ae19-d36d8af57712',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    },
    {
      'id': 3,
      'title': '이벤트-!!!',
      'imagePath':
          'https://github.com/user-attachments/assets/5ec59646-fe98-4010-8351-16bf3a06dc8a',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    },
    {
      'id': 4,
      'title': '이벤트-!!!!',
      'imagePath':
          'https://github.com/user-attachments/assets/f6ce5aa2-418e-412c-8bc1-9edb7f43592b',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    }
  ]
};

final weeklyMockData = {
  'pagination': {
    'page': 1,
    'totalCount': 10,
    'hasMore': false,
  },
  'contents': [
    {
      'id': 1,
      'title': '이벤트 1',
      'imagePath':
          'https://github.com/user-attachments/assets/4439ac76-4eaf-43bb-8863-d214f1d42eb7',
      'linkUrl': '/events/rullet',
      'participated': false,
    },
    {
      'id': 2,
      'title': '이벤트-!!',
      'imagePath':
          'https://github.com/user-attachments/assets/e2a42060-9a42-456d-ae19-d36d8af57712',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    },
    {
      'id': 3,
      'title': '이벤트-!!!',
      'imagePath':
          'https://github.com/user-attachments/assets/5ec59646-fe98-4010-8351-16bf3a06dc8a',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    },
    {
      'id': 4,
      'title': '이벤트-!!!!',
      'imagePath':
          'https://github.com/user-attachments/assets/f6ce5aa2-418e-412c-8bc1-9edb7f43592b',
      'linkUrl': 'https://example.com/event2',
      'participated': false,
    }
  ]
};
