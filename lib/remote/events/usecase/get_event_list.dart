import 'dart:io';

import 'package:dio/dio.dart';
import 'package:naamk_wallet/config/feature/exception/dio_exception_mapper.dart';
import 'package:naamk_wallet/remote/common/states/data_state.dart';
import 'package:naamk_wallet/config/core/remote/base_usecase.dart';
import 'package:naamk_wallet/remote/events/states/feature_state/list_state.dart';
import 'package:naamk_wallet/remote/events/dtos/req_dto/event_banner_req_dto.dart';
import 'package:naamk_wallet/remote/events/repository/event_screen_repository.dart';
import 'package:naamk_wallet/remote/events/repository/event_screen_repository_mock.dart';

/// API별 인터페이스 클래스
class GetEventList
    implements BaseUseCase<DataState<EventListState>, EventBannerReqDto> {
  final EventScreenRepository _repository;
  final EventScreenRepositoryMock _repositoryMock;

  final DioExceptionMapper _dioException = DioExceptionMapper();

  GetEventList(
    this._repository,
    this._repositoryMock,
  );

  @override
  Future<DataState<EventListState>> call({EventBannerReqDto? req}) async {
    try {
      final reqParams = req?.toJson();
      final httpResponse = await _repositoryMock.getEventList(reqParams);
      // final httpResponse = await _repository.getEventList(
      //   req.options,
      // );
      // throw Exception('test!!!!');

      final int? statusCode = httpResponse.response.statusCode;
      if (statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(_dioException.exceptionWithStatusCode(statusCode));
    } on DioException catch (e) {
      return DataFailed(_dioException.exceptionWithDioException(e));
    } catch (e) {
      return DataFailed(_dioException.exceptionWithUnkown(e));
    }
  }
}
