import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class AppLockSetupPage extends StatefulWidget {
  const AppLockSetupPage({super.key});

  @override
  State<AppLockSetupPage> createState() => _AppLockSetupPageState();
}

class _AppLockSetupPageState extends State<AppLockSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('핀락 설정'),
      ),
    );
  }
}
