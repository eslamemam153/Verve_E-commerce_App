import 'package:flutter/material.dart';

class ProductDetailsTopBar extends StatelessWidget {
  const ProductDetailsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.close, size: 28, color: colorScheme.onSurface),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  size: 26,
                  color: colorScheme.onSurface,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 28,
                  color: colorScheme.onSurface,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
