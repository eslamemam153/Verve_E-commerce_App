import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/product_details/components/product_card.dart';


class HorizontalProductList extends StatelessWidget {
  final int startIndex;
  final int maxItems;

  const HorizontalProductList({
    super.key,
    this.startIndex = 0,
    this.maxItems = 6,
  });

  @override
  Widget build(BuildContext context) {
    int availableItems = listOfProducts.length > startIndex
        ? listOfProducts.length - startIndex
        : 0;

    int itemsToDisplay = min(availableItems, maxItems);

    if (itemsToDisplay == 0) return const SizedBox();

    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: itemsToDisplay,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          int actualIndex = index + startIndex;
          return SizedBox(
            width: 160,
            child: ProductCard(
              productModel: listOfProducts[actualIndex],
              onFavoriteChanged: () {},
            ),
          );
        },
      ),
    );
  }
}
