import 'package:flutter/material.dart';

class ItemBuilder extends StatelessWidget {
  final List<String> items;

  const ItemBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surfaceContainer,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant, width: 0.8),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 15,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              ),
              if (index < items.length - 1)
                Divider(
                  height: 1,
                  color: colorScheme.outlineVariant,
                  indent: 16,
                  endIndent: 16,
                ),
            ],
          );
        }),
      ),
    );
  }
}
