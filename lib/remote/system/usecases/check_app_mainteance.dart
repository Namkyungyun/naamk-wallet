import 'dart:io';

import 'package:dio/dio.dart';
import 'package:naamk_wallet/config/core/remote/base_usecase.dart';
import 'package:naamk_wallet/config/feature/exception/dio_exception_mapper.dart';
import 'package:naamk_wallet/remote/common/states/data_state.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository_mock.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';

class CheckAppMaintenance
    implements
        BaseUseCase<DataState<AppMaintenanceState>, Map<String, dynamic>?> {
  final SystemRepository _repository;
  final SystemRepositoryMock _repositoryMock;

  final DioExceptionMapper _dioException = DioExceptionMapper();

  CheckAppMaintenance(this._repository, this._repositoryMock);

  @override
  Future<DataState<AppMaintenanceState>> call(
      {Map<String, dynamic>? req}) async {
    try {
      final httpResponse = await _repositoryMock.checkAppMaintenance();

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
