import 'package:naamk_wallet/remote/system/repository/system_repository.dart';
import 'package:naamk_wallet/remote/system/repository/system_repository_mock.dart';
import 'package:naamk_wallet/remote/system/usecases/user_login_session.dart';

class SystemUsecases {
  final GetUserLoginSession getUserLoginSession;

  SystemUsecases(
      SystemRepository repository, SystemRepositoryMock repositoryMock)
      : getUserLoginSession = GetUserLoginSession(repository, repositoryMock);
}
