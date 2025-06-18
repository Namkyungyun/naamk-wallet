import 'package:naamk_wallet/config/di/ui_common_module.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final bool isMore;
  final VoidCallback? onPushDetail;

  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.isMore,
    this.onPushDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).primaryTextTheme.titleLarge),
        IconButton(
          onPressed: onPushDetail,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
