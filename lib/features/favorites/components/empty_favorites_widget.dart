import 'package:flutter/material.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  final VoidCallback? onExplorePressed;

  const EmptyFavoritesWidget({super.key, this.onExplorePressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/favorites .png", height: 329, width: 329),
          const SizedBox(height: 30),
          Text(
            "No Favourites yet!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (onExplorePressed != null) {
                onExplorePressed!();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Explore!", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
