import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const DrawerTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.maybePop(context);
            Navigator.pushNamed(context, routeName);
          },
          splashColor: colorScheme.primary.withOpacity(0.12),
          leading: Icon(icon, color: colorScheme.primary),
          title: Text(
            title,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Divider(height: 1, color: colorScheme.outlineVariant),
      ],
    );
  }
}
