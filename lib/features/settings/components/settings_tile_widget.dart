import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool showDivider;
  final bool isDestructive;

  const SettingsTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.showDivider = true,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final textColor = isDestructive ? colorScheme.error : colorScheme.onSurface;
    final iconColor = isDestructive ? colorScheme.error : colorScheme.primary;

    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          onTap: () {},
        ),

        if (showDivider)
          Divider(
            indent: 20,
            endIndent: 20,
            height: 1,
            color: colorScheme.outlineVariant,
          ),
      ],
    );
  }
}
