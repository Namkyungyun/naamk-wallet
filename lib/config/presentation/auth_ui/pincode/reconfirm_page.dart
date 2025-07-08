import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class PincodeReConfirmPage extends StatefulWidget {
  const PincodeReConfirmPage({super.key});

  @override
  State<PincodeReConfirmPage> createState() => _PincodeReConfirmPageState();
}

class _PincodeReConfirmPageState extends State<PincodeReConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('핀코드 재확인'),
      ),
    );
  }
}
