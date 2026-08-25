import 'package:flutter/material.dart';
import 'package:flutter_session_1/components/product_card.dart';
import 'package:flutter_session_1/models/product_model.dart';

class FavoritesPage extends StatefulWidget {
  final VoidCallback? onExplorePressed; // ضفنا الدالة دي هنا

  const FavoritesPage({super.key, this.onExplorePressed});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    // هنا بنفلتر المنتجات اللي المستخدم داس على القلب بتاعها
    final favoriteProducts = listOfProducts
        .where((product) => product.isFavorite)
        .toList();

    // بنحدد الشاشة فاضية ولا مليانة بناءً على النتيجة
    final bool isEmpty = favoriteProducts.isEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. AppBar
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
                    "Favorites",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    isEmpty
                        ? "0 Articles"
                        : "${favoriteProducts.length} results",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 3. المحتوى المتغير
            Expanded(
              child: isEmpty
                  ? _buildEmptyState()
                  : _buildPopulatedState(favoriteProducts),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopulatedState(List<ProductModel> favoriteProducts) {
    return Column(
      children: [
        _buildFilters(),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio:
                  0.50, // <--- صغرت النسبة شوية عشان يدي الكارت طول أكتر ويمنع الـ Overflow
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                productModel: favoriteProducts[index],
                // الدالة دي بتعمل ريفرش لصفحة المفضلة عشان لو شلت الإعجاب المنتج يختفي فوراً
                onFavoriteChanged: () {
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/favorites .png", height: 329, width: 329),
          // Icon(Icons.favorite, size: 120, color: Colors.grey.shade200),
          const SizedBox(height: 30),
          const Text(
            "No Favourites yet!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // لما نضغط، بنستدعي الدالة اللي هنباصيها من الـ MainNavigation
              if (widget.onExplorePressed != null) {
                widget.onExplorePressed!();
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
            child: const Text("Explore!", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    final filters = ["Deals", "Brand", "Size", "Color"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 18,
              color: Colors.black,
            ),
            label: const Text("Filter", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(width: 10),
          ...filters.map((filter) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  filter,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
