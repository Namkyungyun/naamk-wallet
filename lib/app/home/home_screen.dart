import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => {context.push('/event/rullet')},
            child: Text('main'),
          ),
        ),
      ),
    );
  }
}
