import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('로그인 스크린'),
            ElevatedButton(
              onPressed: () => context.go(AppGnbRoute.home.route),
              child: const Text('to home'),
            )
          ],
        ),
      ),
    );
  }
}
