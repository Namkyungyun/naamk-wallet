import 'package:naamk_wallet/config/di/ui_common_module.dart';

class TitleAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double toolbarHeight = 60;

  const TitleAppbarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.start,
      ),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      bottomOpacity: 0,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
