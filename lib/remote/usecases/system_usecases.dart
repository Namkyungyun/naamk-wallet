import 'package:naamk_wallet/remote/system/repository/system_repository.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository_mock.dart';
import 'package:naamk_wallet/remote/system/usecases/check_app_mainteance.dart';
import 'package:naamk_wallet/remote/system/usecases/get_user_login_session.dart';

class SystemUsecases {
  final GetUserLoginSession getUserLoginSession;
  final CheckAppMaintenance checkAppMaintenance;

  SystemUsecases(
      SystemRepository repository, SystemRepositoryMock repositoryMock)
      : getUserLoginSession = GetUserLoginSession(repository, repositoryMock),
        checkAppMaintenance = CheckAppMaintenance(repository, repositoryMock);
}
