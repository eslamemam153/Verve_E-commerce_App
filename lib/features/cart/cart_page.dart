import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/cart/components/cart_empty_widget.dart';
import 'package:flutter_session_1/features/cart/components/cart_populated_widget.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';

class CartPage extends StatefulWidget {
  final VoidCallback? onInspirePressed;

  const CartPage({super.key, this.onInspirePressed});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = cartItems.isEmpty;
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
                    "Shopping Cart",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "${cartItems.length} Articles",
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
                  ? EmptyCartWidget(onInspirePressed: widget.onInspirePressed)
                  : PopulatedCartWidget(
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
