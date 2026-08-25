import 'package:flutter/material.dart';
import 'package:flutter_session_1/models/product_model.dart'; // تأكد من المسار

class ProductDetailsPage extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsPage({super.key, required this.productModel});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // متغير لتخزين المقاس المختار (مثال بسيط)
  String? selectedSize;
  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Bar (Close, Share, Cart)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 26,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 2. Product Image Section (with Stack for Dots & Heart)
            Expanded(
              child: Stack(
                children: [
                  // صورة المنتج
                  // صورة المنتج
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: widget.productModel.image.startsWith('http')
                          ? Image.asset(
                              widget.productModel.image,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              widget.productModel.image,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),

                  // النقاط السفلية (Dots Indicator)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: index == 0
                                ? 8
                                : 6, // النقطة الأولى أكبر شوية
                            height: index == 0 ? 8 : 6,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.black
                                  : Colors.grey.shade400,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  // زرار المفضلة (Heart Icon) العائم على الصورة
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.productModel.isFavorite =
                              !widget.productModel.isFavorite;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.productModel.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.productModel.isFavorite
                              ? Colors.red
                              : Colors.grey,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Product Details & Actions (Bottom Section)
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الماركة والسعر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productModel.subTitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${widget.productModel.price}", // استخدمت السعر من الـ Model
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // اسم المنتج
                  Text(
                    widget.productModel.title,
                    style: const TextStyle(fontSize: 22, color: Colors.black87),
                  ),
                  const SizedBox(height: 24),

                  // قائمة اختيار المقاس (Dropdown)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSize,
                        hint: const Text(
                          "Choose size",
                          style: TextStyle(color: Colors.grey),
                        ),
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        items: sizes.map((String size) {
                          return DropdownMenuItem<String>(
                            value: size,
                            child: Text(size),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSize = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // زرار الإضافة للعربة (Add to Bag)
                  // زرار الإضافة للعربة (Add to Bag)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // التأكد إن المنتج مش موجود في العربة قبل كده عشان مانكرروش
                        if (!cartItems.contains(widget.productModel)) {
                          cartItems.add(widget.productModel);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Item added to bag!'),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Item is already in the bag!'),
                              backgroundColor: Colors.orange,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Add to Bag",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
