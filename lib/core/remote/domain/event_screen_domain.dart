import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:naamk_wallet/core/remote/config/base_usecase.dart';
import 'package:naamk_wallet/common/states/data_state.dart';
import 'package:naamk_wallet/core/remote/config/dio_exception.dart';
import 'package:naamk_wallet/core/remote/domain/event_screen_params.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';
import 'package:naamk_wallet/core/remote/events/usecase/event_screen_usecase.dart';
import 'package:naamk_wallet/core/remote/events/usecase/event_screen_usecase_mock.dart';

// api 최초 호출 파트 (ui 이벤트를 받는 파트)
class EventScreenDomain {
  final GetEventList _getEventList;

  EventScreenDomain(this._getEventList);

  GetEventList getEventList() => _getEventList;
}

class GetEventList
    implements
        BaseUseCase<DataState<List<EventBannerResDto>>, GetEventListParams> {
  final EventScreenUseCase _eventScreenUseCase;
  final EventScreenUseCaseMock _eventScreenUseCaseMock;

  GetEventList(
    this._eventScreenUseCase,
    this._eventScreenUseCaseMock,
  );

  @override
  Future<DataState<List<EventBannerResDto>>> call(
      {required GetEventListParams params}) async {
    try {
      final httpResponse = await _eventScreenUseCaseMock.getEventList(
        params.page,
        params.options,
      );
      // final httpResponse = await _eventScreenUseCase.getEventList(
      //   params.page,
      //   params.options,
      // );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.response.statusMessage);
    } on DioException catch (e) {
      final errorMessage = CustomDioException.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e.toString());
    }
  }
}
