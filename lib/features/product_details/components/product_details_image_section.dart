import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';

class ProductDetailsImageSection extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback onFavoriteToggle;

  const ProductDetailsImageSection({
    super.key,
    required this.productModel,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: productModel.image.startsWith('http')
                ? Image.asset(productModel.image, fit: BoxFit.contain)
                : Image.asset(productModel.image, fit: BoxFit.contain),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == 0 ? 8 : 6,
                  height: index == 0 ? 8 : 6,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? colorScheme.primary
                        : colorScheme.outlineVariant,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: GestureDetector(
            onTap: onFavoriteToggle,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                productModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: productModel.isFavorite
                    ? colorScheme.error
                    : colorScheme.onSurfaceVariant,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
