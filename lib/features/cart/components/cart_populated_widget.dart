import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/cart/components/cart_item_widget.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';


class PopulatedCartWidget extends StatelessWidget {
  final VoidCallback onStateChange;

  const PopulatedCartWidget({super.key, required this.onStateChange});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) =>
                Divider(height: 30, color: colorScheme.outlineVariant),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemWidget(
                item: item,
                onRemove: () {
                  cartItems.remove(item);
                  onStateChange();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Item removed from cart'),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 1),
                      backgroundColor: colorScheme.inverseSurface,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
