// import 'package:flutter/material.dart';
// import 'package:flutter_session_1/components/home_banner.dart';
// import 'package:flutter_session_1/components/home_category_section.dart';
// import 'package:flutter_session_1/components/home_drawer.dart';
// import 'package:flutter_session_1/components/product_card.dart';
// import 'package:flutter_session_1/models/product_model.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: HomeDrawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Verve",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//         ),

//         actionsPadding: EdgeInsets.symmetric(horizontal: 20),
//         actions: [
//           Icon(Icons.search, size: 30),
//           SizedBox(width: 10),
//           Icon(Icons.shopping_bag_rounded, size: 30),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 spacing: 10,
//                 children: [
//                   ChoiceChip(
//                     selected: true,
//                     onSelected: (value) {},
//                     showCheckmark: false,
//                     selectedColor: Colors.black,

//                     label: Text("All"),

//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     labelStyle: TextStyle(color: Colors.white),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusGeometry.circular(20),
//                     ),
//                   ),
//                   HomeCategorySection(),
//                   HomeCategorySection(),
//                   HomeCategorySection(),
//                   HomeCategorySection(),
//                   HomeCategorySection(),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             HomeBanner(),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Best Seller", style: TextStyle(fontSize: 24)),
//                 Text(
//                   "See all",
//                   style: TextStyle(fontSize: 16, color: Colors.lightBlue),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 450,
//               child: ListView.separated(
//                 itemCount: listOfProducts.length,
//                 separatorBuilder: (context, index) => SizedBox(width: 20),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) =>
//                     ProductCard(productModel: listOfProducts[index]),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_session_1/components/home_banner.dart';
import 'package:flutter_session_1/components/product_card.dart'; // تأكد من استدعاء الكارت والبيانات

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Verve",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        actions: const [
          Icon(Icons.search, size: 28, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.shopping_bag_outlined, size: 28, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Categories Chips
            _buildCategories(),
            const SizedBox(height: 20),
            HomeBanner(),

            // 2. Hot Drops Banner
            // _buildBanner(
            //   "Hot drops",
            //   "Wait is over. Get it.",
            //   Colors.purple.shade100,
            // ),
            const SizedBox(height: 30),

            // 3. Best Sellers Section
            _buildSectionHeader("Best Sellers"),
            _buildHorizontalProductList(),
            const SizedBox(height: 30),

            // 4. Winter Sale Banner
            _buildBanner(
              "Winter Sale",
              "Stay warm & stylish\nwith our newest collection",
              Colors.indigo.shade900,
              isDark: true,
            ),
            const SizedBox(height: 30),

            // 5. Sports Section (Dark Background)
            Container(
              color: Colors.grey.shade900,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Sports",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // صورة بانر داخلية
                  Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        // التعديل هنا
                        image: AssetImage("assets/images/sports.jpg"),
                        fit: BoxFit
                            .cover, // يفضل إضافتها عشان الصورة تملى الكونتينر بشكل متناسق
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildHorizontalProductList(isDarkBg: true),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 6. All items (Grid View)
            _buildSectionHeader("All items"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap:
                    true, // مهم جداً عشان الـ Grid يشتغل جوه SingleChildScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // بنقفل السكرول الداخلي
                // نعرض 4 أو عدد العناصر المتاحة لو هما أقل من 4
                itemCount: listOfProducts.length > 4
                    ? 4
                    : listOfProducts
                          .length, // نعرض 4 عناصر كمثال في الشاشة الرئيسية
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.55, // نسبة العرض للطول للكارت
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    productModel: listOfProducts[index],
                  ); // بناخد عناصر عشوائية من الليست
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- Helpers Widgets لتحسين نظافة الكود ---

  Widget _buildCategories() {
    final categories = ["All", "Men", "Women", "Kids", "Bags"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: categories.map((cat) {
          bool isSelected = cat == "All";
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: Colors.black,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.black : Colors.grey.shade300,
                ),
              ),
              onSelected: (value) {},
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            "See all",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalProductList({bool isDarkBg = false}) {
    return SizedBox(
      height: 310,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: listOfProducts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return ProductCard(productModel: listOfProducts[index]);
        },
      ),
    );
  }

  Widget _buildBanner(
    String title,
    String subtitle,
    Color bgColor, {
    bool isDark = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? Colors.white : Colors.black,
              foregroundColor: isDark ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Shop"),
          ),
        ],
      ),
    );
  }
}
