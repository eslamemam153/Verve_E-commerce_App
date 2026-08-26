import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/favorites/components/favorites_filters_widget.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';
import 'package:flutter_session_1/features/product_details/components/product_card.dart';


class PopulatedFavoritesWidget extends StatelessWidget {
  final List<ProductModel> favoriteProducts;
  final VoidCallback onStateChange;

  const PopulatedFavoritesWidget({
    super.key,
    required this.favoriteProducts,
    required this.onStateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FavoritesFiltersWidget(),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 0.50,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                productModel: favoriteProducts[index],
                onFavoriteChanged: onStateChange,
              );
            },
          ),
        ),
      ],
    );
  }
}
