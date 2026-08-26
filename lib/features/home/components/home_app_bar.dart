import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ColorScheme colorScheme;

  const HomeAppBar({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      title: Text(
        "Verve",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: colorScheme.onSurface,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
      actions: [
        Icon(Icons.search, size: 28, color: colorScheme.onSurface),
        const SizedBox(width: 16),
        Icon(
          Icons.shopping_bag_outlined,
          size: 28,
          color: colorScheme.onSurface,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
