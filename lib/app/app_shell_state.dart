import 'package:go_router/go_router.dart';

class AppShellState {
  static StatefulNavigationShell? _shell;

  static StatefulNavigationShell? get getShell => _shell;
  static void setShell(StatefulNavigationShell shell) => _shell = shell;
}
