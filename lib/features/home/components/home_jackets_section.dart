import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/components/home_header_section.dart';
import 'package:flutter_session_1/features/product_details/components/product_card.dart';

class JacketsSectionWidget extends StatelessWidget {
  final VoidCallback? onSeeAllPressed;
  final int startIndex;
  final int maxItems;

  const JacketsSectionWidget({
    super.key,
    this.onSeeAllPressed,
    this.startIndex = 17,
    this.maxItems = 6,
  });

  @override
  Widget build(BuildContext context) {
    int availableItems = listOfProducts.length > startIndex
        ? listOfProducts.length - startIndex
        : 0;

    int itemsToDisplay = min(availableItems, maxItems);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(title: "Jackets", onSeeAllPressed: onSeeAllPressed),
          const SizedBox(height: 16),
          if (itemsToDisplay > 0)
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsToDisplay,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 0.59,
              ),
              itemBuilder: (context, index) {
                int actualIndex = index + startIndex;

                return ProductCard(
                  productModel: listOfProducts[actualIndex],
                  onFavoriteChanged: () {},
                );
              },
            ),
        ],
      ),
    );
  }
}
