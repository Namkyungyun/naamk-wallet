import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class PincodeConfirmPage extends StatefulWidget {
  const PincodeConfirmPage({super.key});

  @override
  State<PincodeConfirmPage> createState() => _PincodeConfirmPageState();
}

class _PincodeConfirmPageState extends State<PincodeConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('핀코드 확인'),
      ),
    );
  }
}
