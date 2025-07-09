import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class SettigInfoListTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final Widget trailingWidget;
  final String title;
  final VoidCallback? onTap;

  const SettigInfoListTileWidget({
    super.key,
    required this.leadingIcon,
    required this.trailingWidget,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 24,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 4.0), // 아이콘과 텍스트 간격
        child: Text(
          key: ValueKey(context.locale.languageCode),
          title.tr(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      trailing: trailingWidget,
      onTap: onTap,
    );
  }
}
