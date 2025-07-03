import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/config/presentation/route/app_router_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => AppRouterState.pushDetailPageWithShell(
                context, '/events/rullet'),
            child: const Text('main'),
          ),
        ),
      ),
    );
  }
}
