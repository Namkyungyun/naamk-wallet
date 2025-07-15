import 'dart:io';

import 'package:dio/dio.dart';
import 'package:naamk_wallet/config/core/remote/base_usecase.dart';
import 'package:naamk_wallet/config/feature/exception/dio_exception_mapper.dart';
import 'package:naamk_wallet/remote/common/states/data_state.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository_mock.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';

class GetUserLoginSession
    implements BaseUseCase<DataState<LoginSessionState>, String?> {
  final SystemRepository _repository;
  final SystemRepositoryMock _repositoryMock;

  final DioExceptionMapper _dioException = DioExceptionMapper();

  GetUserLoginSession(this._repository, this._repositoryMock);

  @override
  Future<DataState<LoginSessionState>> call({String? req}) async {
    try {
      final reqBody = {'userId': req};

      final httpResponse = await _repositoryMock.getUserLoginSession(reqBody);
      // final httpResponse =
      //     await _repository.getUserLoginSession(reqBody);
      // throw Exception('ddd');
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
