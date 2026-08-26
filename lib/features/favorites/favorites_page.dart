import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/favorites/components/empty_favorites_widget.dart';
import 'package:flutter_session_1/features/favorites/components/populated_favorites_widget.dart';
import 'package:flutter_session_1/features/product_details/components/product_card.dart';


class FavoritesPage extends StatefulWidget {
  final VoidCallback? onExplorePressed;

  const FavoritesPage({super.key, this.onExplorePressed});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = listOfProducts
        .where((product) => product.isFavorite)
        .toList();

    final bool isEmpty = favoriteProducts.isEmpty;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verve",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                        color: colorScheme.onSurface,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 28,
                        color: colorScheme.onSurface,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Favorites",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    isEmpty
                        ? "0 Articles"
                        : "${favoriteProducts.length} results",
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: isEmpty
                  ? EmptyFavoritesWidget(
                      onExplorePressed: widget.onExplorePressed,
                    )
                  : PopulatedFavoritesWidget(
                      favoriteProducts: favoriteProducts,
                      onStateChange: () {
                        setState(() {});
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
