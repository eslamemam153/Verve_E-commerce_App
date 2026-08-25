import 'package:flutter/material.dart';
import 'package:flutter_session_1/models/product_model.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Verve",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.search, size: 28),
                      const SizedBox(width: 16),
                      const Icon(Icons.shopping_bag_outlined, size: 28),
                    ],
                  ),
                ],
              ),
            ),

            // 2. Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Shopping Cart",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${cartItems.length} Articles",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: isEmpty ? _buildEmptyState() : _buildPopulatedState(),
            ),
          ],
        ),
      ),
    );
  }

  // --- Views ---

  // عرض العربة المليانة
  Widget _buildPopulatedState() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 30, color: Colors.grey),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Row(
                children: [
                  // صورة المنتج
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // تفاصيل المنتج
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.subTitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${item.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // زرار الحذف
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black54),
                    onPressed: () {
                      setState(() {
                        cartItems.remove(
                          item,
                        ); // بيمسح المنتج ويعمل ريفريش للشاشة
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item removed from cart'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),

        // زرار الدفع (Checkout)
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
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

  // عرض العربة الفاضية (الكود القديم بتاعك)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/cart.png", width: 329, height: 329),
          const SizedBox(height: 30),
          const Text(
            "Cart is empty",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (widget.onInspirePressed != null) {
                widget.onInspirePressed!();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Inspire me!", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
