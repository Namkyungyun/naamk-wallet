import 'package:flutter/material.dart';

class SettigPushListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettigPushListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 4.0), // 아이콘과 텍스트 간격
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
