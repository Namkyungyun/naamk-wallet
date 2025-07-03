import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class PincodeSetupPage extends StatefulWidget {
  const PincodeSetupPage({super.key});

  @override
  State<PincodeSetupPage> createState() => _PincodeSetupPageState();
}

class _PincodeSetupPageState extends State<PincodeSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('핀코드 설정'),
      ),
    );
  }
}
