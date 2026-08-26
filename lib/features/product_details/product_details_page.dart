import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';
import 'package:flutter_session_1/features/product_details/components/product_details_bottom_section.dart';
import 'package:flutter_session_1/features/product_details/components/product_details_image_section.dart';
import 'package:flutter_session_1/features/product_details/components/product_details_top_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsPage({super.key, required this.productModel});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductDetailsTopBar(),
            Expanded(
              child: ProductDetailsImageSection(
                productModel: widget.productModel,
                onFavoriteToggle: () {
                  setState(() {
                    widget.productModel.isFavorite =
                        !widget.productModel.isFavorite;
                  });
                },
              ),
            ),
            ProductDetailsBottomSection(
              productModel: widget.productModel,
              selectedSize: selectedSize,
              onSizeChanged: (String? newValue) {
                setState(() {
                  selectedSize = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
