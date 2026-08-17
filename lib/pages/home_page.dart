import 'package:flutter/material.dart';
import 'package:flutter_session_1/components/home_banner.dart';
import 'package:flutter_session_1/components/home_category_section.dart';
import 'package:flutter_session_1/components/home_drawer.dart';
import 'package:flutter_session_1/components/product_card.dart';
import 'package:flutter_session_1/models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Verve",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),

        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: [
          Icon(Icons.search, size: 30),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_rounded, size: 30),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  ChoiceChip(
                    selected: true,
                    onSelected: (value) {},
                    showCheckmark: false,
                    selectedColor: Colors.black,

                    label: Text("All"),

                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  ),
                  HomeCategorySection(),
                  HomeCategorySection(),
                  HomeCategorySection(),
                  HomeCategorySection(),
                  HomeCategorySection(),
                ],
              ),
            ),
            SizedBox(height: 20),
            HomeBanner(),
            // ElevatedButton(onPressed: () {}, child: Text("Pay")),
            // TextButton.icon(
            //   onPressed: () {},
            //   label: Text("Do not Have an account"),
            //   icon: Icon(Icons.abc_outlined),
            // ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Seller", style: TextStyle(fontSize: 24)),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                ),
              ],
            ),
            SizedBox(
              height: 450,
              child: ListView.separated(
                itemCount: listOfProducts.length,
                separatorBuilder: (context, index) => SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ProductCard(productModel: listOfProducts[index]),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
