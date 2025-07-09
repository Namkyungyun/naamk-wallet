import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_info_listtile_widget.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state_manager.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthSettingWidget extends StatelessWidget {
  AuthSettingWidget({super.key});

  // 전체 빌드가 일어나지 않고, ValueListenableBuilder 내부만 빌드가 일어나도록.
  final ValueNotifier<bool> _showDetailSettingCard = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AuthSettingButtonWidget(
          isShowing: _showDetailSettingCard,
          onTab: () =>
              _showDetailSettingCard.value = !_showDetailSettingCard.value,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _showDetailSettingCard,
          builder: (context, show, _) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: ClipRect(
                child: show
                    ? const AuthSettingBoxWidget()
                    : const SizedBox.shrink(),
              ),
            );
          },
        )
      ],
    );
  }
}

class AuthSettingButtonWidget extends StatelessWidget {
  final ValueNotifier<bool> isShowing;
  final VoidCallback onTab;

  const AuthSettingButtonWidget({
    super.key,
    required this.isShowing,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SettigInfoListTileWidget(
      leadingIcon: Icons.security,
      title: 'setting_page.list.auth',
      onTap: onTab,
      trailingWidget: ValueListenableBuilder<bool>(
        valueListenable: isShowing,
        builder: (context, show, _) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: ClipRect(
              child: Icon(
                show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 28,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class AuthSettingBoxWidget extends StatelessWidget {
  const AuthSettingBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppAuthLockSwitchWidget(),
            AppBiometricAuthSwitchWidget(),
            AppPincodeAuthSwitchWidget(),
          ],
        ),
      ),
    );
  }
}

class AppAuthLockSwitchWidget extends StatelessWidget {
  const AppAuthLockSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        key: ValueKey(context.locale.languageCode),
        'setting_page.auth.appLock'.tr(),
      ),
      trailing: Consumer(
        builder: (context, ref, _) {
          final List<String> labels = ['off', 'on'];
          final bool useAppLock =
              ref.watch<AppAuth>(appAuthStateManagerProvider).useLock;
          final appAuthStateNotifier = ref
              .read<AppAuthStateManager>(appAuthStateManagerProvider.notifier);

          return ToggleSwitch(
            minWidth: 40,
            minHeight: 30,
            initialLabelIndex: switch (useAppLock) {
              false => 0,
              true => 1,
            },
            cornerRadius: 8.0,
            totalSwitches: 2,
            labels: labels,
            customTextStyles: labels
                .map<TextStyle>((el) => const TextStyle(fontSize: 10))
                .toList(),
            inactiveBgColor: Theme.of(context).cardColor,
            activeBgColor: labels
                .map<Color>((el) => Theme.of(context).primaryColor)
                .toList(),
            onToggle: (index) async {
              if (index == null) return;
              final use = switch (index) { 0 => false, _ => true };

              appAuthStateNotifier.setUseAppLock(use);
            },
          );
        },
      ),
    );
  }
}

class AppBiometricAuthSwitchWidget extends StatelessWidget {
  const AppBiometricAuthSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        key: ValueKey(context.locale.languageCode),
        'setting_page.auth.biometricAuth'.tr(),
      ),
      trailing: Consumer(
        builder: (context, ref, _) {
          final List<String> labels = ['off', 'on'];
          final bool useBiometric =
              ref.watch<AppAuth>(appAuthStateManagerProvider).method ==
                  AppAuthMethod.biometric;

          final appAuthStateNotifier = ref
              .read<AppAuthStateManager>(appAuthStateManagerProvider.notifier);

          return ToggleSwitch(
            minWidth: 40,
            minHeight: 30,
            initialLabelIndex: switch (useBiometric) {
              false => 0,
              true => 1,
            },
            cornerRadius: 8.0,
            totalSwitches: 2,
            labels: labels,
            customTextStyles: labels
                .map<TextStyle>((el) => const TextStyle(fontSize: 10))
                .toList(),
            inactiveBgColor: Theme.of(context).cardColor,
            activeBgColor: labels
                .map<Color>((el) => Theme.of(context).primaryColor)
                .toList(),
            onToggle: (index) async {
              if (index == null) return;
              final use = switch (index) { 0 => false, _ => true };
              final String method = use
                  ? AppAuthMethod.biometric.name
                  : AppAuthMethod.pinOnly.name;

              appAuthStateNotifier.setAppAuthMethod(method);
            },
          );
        },
      ),
    );
  }
}

class AppPincodeAuthSwitchWidget extends StatelessWidget {
  const AppPincodeAuthSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        key: ValueKey(context.locale.languageCode),
        'setting_page.auth.changePincode'.tr(),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }
}
