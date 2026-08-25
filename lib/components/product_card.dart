import 'package:flutter/material.dart';
import 'package:flutter_session_1/models/product_model.dart';
import 'package:flutter_session_1/pages/product_details_page.dart';
// import 'package:flutter_session_1/models/product_model.dart';

// final List<ProductModel> listOfProducts = [
//   ProductModel(
//     title: "product 1",
//     subTitle: "subTitle",
//     image: "assets/images/gettyimages-114091224-612x612.jpg",
//     price: "300",
//   ),
//   ProductModel(
//     title: "product 2",
//     subTitle: "subTitle",
//     image: "assets/images/Sun-Glasses.jpg",
//     price: "250",
//   ),
// ];

// class ProductCard extends StatelessWidget {
//   const ProductCard({super.key, required this.productModel});
//   final ProductModel productModel;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 328,
//           width: 232,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage(productModel.image),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [Text("-10%"), Icon(Icons.favorite)],
//               ),
//               Row(children: [Text("New"), Text("Exclusive")]),
//             ],
//           ),
//         ),
//         Text(productModel.title, style: TextStyle(fontSize: 16)),
//         Text(
//           productModel.subTitle,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//         Text(
//           "\$${productModel.price}",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  final VoidCallback? onFavoriteChanged;

  const ProductCard({
    super.key,
    required this.productModel,
    this.onFavoriteChanged,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final discount = widget.productModel.discount;
    final oldPrice = widget.productModel.oldPrice;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsPage(productModel: widget.productModel),
          ),
        ).then((_) {
          // ضفنا شرط الـ mounted كأمان إضافي لمنع أي كراش
          if (mounted) {
            setState(() {});
          }
        });
      },
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              // شيلنا width: double.infinity من هنا
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // 2. استخدام NetworkImage بدلاً من AssetImage عشان الروابط تشتغل
                  image: AssetImage(widget.productModel.image),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.productModel.isFavorite =
                              !widget.productModel.isFavorite;
                        });
                        if (widget.onFavoriteChanged != null) {
                          widget.onFavoriteChanged!();
                        }
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          widget.productModel.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 18,
                          color: widget.productModel.isFavorite
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  if (discount != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        color: Colors.red,
                        child: Text(
                          discount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Row(
                      children: [
                        if (widget.productModel.isNew)
                          Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            color: Colors.white,
                            child: const Text(
                              "New",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (widget.productModel.isExclusive)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            color: Colors.black,
                            child: const Text(
                              "Exclusive",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Text(
              widget.productModel.subTitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.productModel.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "\$${widget.productModel.price}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: oldPrice != null ? Colors.red : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                if (oldPrice != null)
                  Text(
                    "\$$oldPrice",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<ProductModel> listOfProducts = [
  ProductModel(
    title: "Classic White T-Shirt",
    subTitle: "Premium Cotton Regular Fit",
    image: "assets/images/product_1.png",
    price: "299",
    oldPrice: "399",
    discount: "25%",
    isNew: true,
    isExclusive: false,
    isFavorite: false,
  ),

  ProductModel(
    title: "Classic Black T-Shirt",
    subTitle: "Soft Cotton Everyday T-Shirt",
    image: "assets/images/product_2.png",
    price: "299",
    oldPrice: "349",
    discount: "14%",
    isNew: false,
    isExclusive: false,
    isFavorite: true,
  ),

  ProductModel(
    title: "Oversized Beige T-Shirt",
    subTitle: "Relaxed Streetwear Fit",
    image: "assets/images/product_3.png",
    price: "349",
    isNew: true,
    isExclusive: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Navy Blue T-Shirt",
    subTitle: "Classic Cotton T-Shirt",
    image: "assets/images/product_4.png",
    price: "329",
    oldPrice: "399",
    discount: "18%",
    isFavorite: false,
  ),

  ProductModel(
    title: "Green Graphic T-Shirt",
    subTitle: "Printed Casual Streetwear",
    image: "assets/images/product_5.png",
    price: "379",
    isNew: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Grey Basic T-Shirt",
    subTitle: "Minimal Everyday Cotton Tee",
    image: "assets/images/product_6.png",
    price: "299",
    oldPrice: "349",
    discount: "14%",
    isFavorite: false,
  ),

  ProductModel(
    title: "Red Casual T-Shirt",
    subTitle: "Comfort Cotton Regular Fit",
    image: "assets/images/product_7.png",
    price: "329",
    isExclusive: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Blue Oversized T-Shirt",
    subTitle: "Modern Oversized Streetwear",
    image: "assets/images/product_8.png",
    price: "379",
    oldPrice: "449",
    discount: "16%",
    isNew: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "White Graphic T-Shirt",
    subTitle: "Modern Printed Cotton Tee",
    image: "assets/images/product_9.png",
    price: "349",
    isNew: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Brown Basic T-Shirt",
    subTitle: "Soft Cotton Casual Tee",
    image: "assets/images/product_10.png",
    price: "329",
    oldPrice: "399",
    discount: "18%",
    isFavorite: false,
  ),

  ProductModel(
    title: "Olive Green T-Shirt",
    subTitle: "Relaxed Cotton Fit",
    image: "assets/images/product_11.png",
    price: "349",
    isExclusive: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Cream Oversized T-Shirt",
    subTitle: "Premium Streetwear Fit",
    image: "assets/images/product_12.png",
    price: "379",
    oldPrice: "449",
    discount: "16%",
    isNew: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Yellow Summer T-Shirt",
    subTitle: "Lightweight Summer Cotton",
    image: "assets/images/product_13.png",
    price: "329",
    isNew: true,
    isFavorite: false,
  ),

  ProductModel(
    title: "Maroon T-Shirt",
    subTitle: "Premium Cotton Regular Fit",
    image: "assets/images/product_14.png",
    price: "349",
    oldPrice: "399",
    discount: "13%",
    isFavorite: false,
  ),

  ProductModel(
    title: "Sky Blue T-Shirt",
    subTitle: "Soft Cotton Casual Tee",
    image: "assets/images/product_15.png",
    price: "329",
    isExclusive: true,
    isFavorite: false,
  ),

  // ProductModel(
  //   title: "Purple Streetwear T-Shirt",
  //   subTitle: "Oversized Graphic Style",
  //   image:
  //       "https://loremflickr.com/500/600/purple,streetwear,tshirt/all?lock=16",
  //   price: "379",
  //   oldPrice: "449",
  //   discount: "16%",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Mint Green T-Shirt",
  //   subTitle: "Lightweight Cotton T-Shirt",
  //   image: "https://loremflickr.com/500/600/mint,green,tshirt/all?lock=17",
  //   price: "329",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Striped Casual T-Shirt",
  //   subTitle: "Classic Striped Cotton Tee",
  //   image:
  //       "https://loremflickr.com/500/600/striped,tshirt,clothing/all?lock=18",
  //   price: "369",
  //   oldPrice: "429",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Black Graphic T-Shirt",
  //   subTitle: "Urban Printed Streetwear",
  //   image: "https://loremflickr.com/500/600/black,graphic,tshirt/all?lock=19",
  //   price: "379",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Beige Basic T-Shirt",
  //   subTitle: "Minimal Everyday Essential",
  //   image: "https://loremflickr.com/500/600/beige,basic,tshirt/all?lock=20",
  //   price: "299",
  //   oldPrice: "349",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "White Oxford Shirt",
  //   subTitle: "Smart Casual Button Shirt",
  //   image: "https://loremflickr.com/500/600/white,oxford,shirt/all?lock=21",
  //   price: "499",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Black Formal Shirt",
  //   subTitle: "Slim Fit Formal Shirt",
  //   image: "https://loremflickr.com/500/600/black,formal,shirt/all?lock=22",
  //   price: "549",
  //   oldPrice: "649",
  //   discount: "15%",
  // ),

  // ProductModel(
  //   title: "Blue Casual Shirt",
  //   subTitle: "Regular Fit Cotton Shirt",
  //   image: "https://loremflickr.com/500/600/blue,casual,shirt/all?lock=23",
  //   price: "449",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Beige Linen Shirt",
  //   subTitle: "Lightweight Summer Linen",
  //   image: "https://loremflickr.com/500/600/beige,linen,shirt/all?lock=24",
  //   price: "599",
  //   isNew: true,
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Navy Formal Shirt",
  //   subTitle: "Slim Fit Cotton Shirt",
  //   image: "https://loremflickr.com/500/600/navy,formal,shirt/all?lock=25",
  //   price: "549",
  //   oldPrice: "649",
  //   discount: "15%",
  // ),

  // ProductModel(
  //   title: "Green Casual Shirt",
  //   subTitle: "Relaxed Cotton Button Shirt",
  //   image: "https://loremflickr.com/500/600/green,casual,shirt/all?lock=26",
  //   price: "469",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Brown Linen Shirt",
  //   subTitle: "Premium Summer Linen",
  //   image: "https://loremflickr.com/500/600/brown,linen,shirt/all?lock=27",
  //   price: "599",
  //   oldPrice: "699",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Grey Oxford Shirt",
  //   subTitle: "Smart Casual Oxford",
  //   image: "https://loremflickr.com/500/600/grey,oxford,shirt/all?lock=28",
  //   price: "499",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Cream Casual Shirt",
  //   subTitle: "Relaxed Button Shirt",
  //   image: "https://loremflickr.com/500/600/cream,casual,shirt/all?lock=29",
  //   price: "479",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Red Casual Shirt",
  //   subTitle: "Regular Fit Cotton Shirt",
  //   image: "https://loremflickr.com/500/600/red,casual,shirt/all?lock=30",
  //   price: "469",
  //   oldPrice: "549",
  //   discount: "15%",
  // ),

  // ProductModel(
  //   title: "Blue Denim Shirt",
  //   subTitle: "Classic Denim Button Shirt",
  //   image: "https://loremflickr.com/500/600/blue,denim,shirt/all?lock=31",
  //   price: "599",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Linen Shirt",
  //   subTitle: "Premium Lightweight Linen",
  //   image: "https://loremflickr.com/500/600/black,linen,shirt/all?lock=32",
  //   price: "599",
  //   oldPrice: "699",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "White Linen Shirt",
  //   subTitle: "Breathable Summer Shirt",
  //   image: "https://loremflickr.com/500/600/white,linen,shirt/all?lock=33",
  //   price: "599",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Striped Oxford Shirt",
  //   subTitle: "Classic Smart Casual Style",
  //   image: "https://loremflickr.com/500/600/striped,oxford,shirt/all?lock=34",
  //   price: "549",
  //   oldPrice: "649",
  //   discount: "15%",
  // ),

  // ProductModel(
  //   title: "Navy Casual Shirt",
  //   subTitle: "Modern Regular Fit",
  //   image: "https://loremflickr.com/500/600/navy,casual,shirt/all?lock=35",
  //   price: "469",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Classic White Polo",
  //   subTitle: "Premium Cotton Polo Shirt",
  //   image: "https://loremflickr.com/500/600/white,polo,shirt/all?lock=36",
  //   price: "399",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Black Polo Shirt",
  //   subTitle: "Classic Regular Fit Polo",
  //   image: "https://loremflickr.com/500/600/black,polo,shirt/all?lock=37",
  //   price: "399",
  //   oldPrice: "449",
  //   discount: "11%",
  // ),

  // ProductModel(
  //   title: "Navy Polo Shirt",
  //   subTitle: "Premium Cotton Polo",
  //   image: "https://loremflickr.com/500/600/navy,polo,shirt/all?lock=38",
  //   price: "429",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Green Polo Shirt",
  //   subTitle: "Classic Casual Polo",
  //   image: "https://loremflickr.com/500/600/green,polo,shirt/all?lock=39",
  //   price: "429",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Grey Polo Shirt",
  //   subTitle: "Soft Cotton Regular Fit",
  //   image: "https://loremflickr.com/500/600/grey,polo,shirt/all?lock=40",
  //   price: "399",
  //   oldPrice: "449",
  //   discount: "11%",
  // ),

  // ProductModel(
  //   title: "Blue Striped Polo",
  //   subTitle: "Classic Striped Polo",
  //   image: "https://loremflickr.com/500/600/blue,striped,polo/all?lock=41",
  //   price: "449",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Burgundy Polo Shirt",
  //   subTitle: "Premium Casual Polo",
  //   image: "https://loremflickr.com/500/600/burgundy,polo,shirt/all?lock=42",
  //   price: "429",
  //   oldPrice: "499",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Cream Polo Shirt",
  //   subTitle: "Minimal Classic Polo",
  //   image: "https://loremflickr.com/500/600/cream,polo,shirt/all?lock=43",
  //   price: "429",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Brown Polo Shirt",
  //   subTitle: "Modern Casual Polo",
  //   image: "https://loremflickr.com/500/600/brown,polo,shirt/all?lock=44",
  //   price: "429",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Light Blue Polo",
  //   subTitle: "Summer Cotton Polo",
  //   image: "https://loremflickr.com/500/600/lightblue,polo,shirt/all?lock=45",
  //   price: "419",
  //   oldPrice: "479",
  //   discount: "13%",
  // ),

  // ProductModel(
  //   title: "Classic Blue Jeans",
  //   subTitle: "Slim Fit Denim Jeans",
  //   image: "https://loremflickr.com/500/600/blue,jeans,denim/all?lock=46",
  //   price: "699",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Black Slim Jeans",
  //   subTitle: "Stretch Slim Fit Denim",
  //   image: "https://loremflickr.com/500/600/black,slim,jeans/all?lock=47",
  //   price: "749",
  //   oldPrice: "899",
  //   discount: "17%",
  // ),

  // ProductModel(
  //   title: "Light Blue Jeans",
  //   subTitle: "Straight Fit Denim",
  //   image: "https://loremflickr.com/500/600/lightblue,jeans,denim/all?lock=48",
  //   price: "699",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Dark Blue Jeans",
  //   subTitle: "Classic Dark Denim",
  //   image: "https://loremflickr.com/500/600/darkblue,jeans,denim/all?lock=49",
  //   price: "749",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Washed Blue Jeans",
  //   subTitle: "Vintage Wash Denim",
  //   image: "https://loremflickr.com/500/600/washed,blue,jeans/all?lock=50",
  //   price: "799",
  //   oldPrice: "949",
  //   discount: "16%",
  // ),

  // ProductModel(
  //   title: "Grey Denim Jeans",
  //   subTitle: "Modern Slim Fit Jeans",
  //   image: "https://loremflickr.com/500/600/grey,jeans,denim/all?lock=51",
  //   price: "749",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Relaxed Blue Jeans",
  //   subTitle: "Comfort Relaxed Fit",
  //   image: "https://loremflickr.com/500/600/relaxed,blue,jeans/all?lock=52",
  //   price: "749",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Vintage Black Jeans",
  //   subTitle: "Washed Black Denim",
  //   image: "https://loremflickr.com/500/600/vintage,black,jeans/all?lock=53",
  //   price: "799",
  //   oldPrice: "899",
  //   discount: "11%",
  // ),

  // ProductModel(
  //   title: "Straight Leg Jeans",
  //   subTitle: "Classic Straight Denim",
  //   image: "https://loremflickr.com/500/600/straight,leg,jeans/all?lock=54",
  //   price: "749",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Ripped Blue Jeans",
  //   subTitle: "Modern Streetwear Denim",
  //   image: "https://loremflickr.com/500/600/ripped,blue,jeans/all?lock=55",
  //   price: "799",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Dark Grey Jeans",
  //   subTitle: "Slim Stretch Denim",
  //   image: "https://loremflickr.com/500/600/darkgrey,jeans,denim/all?lock=56",
  //   price: "749",
  //   oldPrice: "849",
  //   discount: "12%",
  // ),

  // ProductModel(
  //   title: "Classic Black Jeans",
  //   subTitle: "Regular Fit Black Denim",
  //   image: "https://loremflickr.com/500/600/black,jeans,denim/all?lock=57",
  //   price: "699",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Indigo Denim Jeans",
  //   subTitle: "Premium Indigo Denim",
  //   image: "https://loremflickr.com/500/600/indigo,jeans,denim/all?lock=58",
  //   price: "799",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Blue Straight Jeans",
  //   subTitle: "Everyday Straight Fit",
  //   image: "https://loremflickr.com/500/600/blue,straight,jeans/all?lock=59",
  //   price: "699",
  //   oldPrice: "799",
  //   discount: "13%",
  // ),

  // ProductModel(
  //   title: "Faded Blue Jeans",
  //   subTitle: "Casual Faded Denim",
  //   image: "https://loremflickr.com/500/600/faded,blue,jeans/all?lock=60",
  //   price: "749",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Beige Chino Pants",
  //   subTitle: "Slim Fit Smart Casual Chinos",
  //   image: "https://loremflickr.com/500/600/beige,chino,pants/all?lock=61",
  //   price: "599",
  //   oldPrice: "699",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Black Chino Pants",
  //   subTitle: "Classic Slim Fit Chinos",
  //   image: "https://loremflickr.com/500/600/black,chino,pants/all?lock=62",
  //   price: "599",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Navy Chino Pants",
  //   subTitle: "Smart Casual Cotton Pants",
  //   image: "https://loremflickr.com/500/600/navy,chino,pants/all?lock=63",
  //   price: "599",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Grey Chino Pants",
  //   subTitle: "Modern Slim Fit Chinos",
  //   image: "https://loremflickr.com/500/600/grey,chino,pants/all?lock=64",
  //   price: "599",
  //   oldPrice: "699",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Khaki Cargo Pants",
  //   subTitle: "Multi Pocket Cargo Pants",
  //   image: "https://loremflickr.com/500/600/khaki,cargo,pants/all?lock=65",
  //   price: "649",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Black Cargo Pants",
  //   subTitle: "Utility Streetwear Cargo",
  //   image: "https://loremflickr.com/500/600/black,cargo,pants/all?lock=66",
  //   price: "699",
  //   oldPrice: "799",
  //   discount: "13%",
  // ),

  // ProductModel(
  //   title: "Olive Cargo Pants",
  //   subTitle: "Relaxed Utility Fit",
  //   image: "https://loremflickr.com/500/600/olive,cargo,pants/all?lock=67",
  //   price: "699",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Brown Cargo Pants",
  //   subTitle: "Classic Utility Cargo",
  //   image: "https://loremflickr.com/500/600/brown,cargo,pants/all?lock=68",
  //   price: "699",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Grey Cargo Pants",
  //   subTitle: "Modern Multi Pocket Pants",
  //   image: "https://loremflickr.com/500/600/grey,cargo,pants/all?lock=69",
  //   price: "699",
  //   oldPrice: "799",
  //   discount: "13%",
  // ),

  // ProductModel(
  //   title: "Black Jogger Pants",
  //   subTitle: "Comfort Athletic Joggers",
  //   image: "https://loremflickr.com/500/600/black,jogger,pants/all?lock=70",
  //   price: "499",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Grey Sweatpants",
  //   subTitle: "Relaxed Cotton Sweatpants",
  //   image:
  //       "https://loremflickr.com/500/600/grey,sweatpants,clothing/all?lock=71",
  //   price: "499",
  //   oldPrice: "599",
  //   discount: "17%",
  // ),

  // ProductModel(
  //   title: "Navy Jogger Pants",
  //   subTitle: "Casual Cotton Joggers",
  //   image: "https://loremflickr.com/500/600/navy,jogger,pants/all?lock=72",
  //   price: "499",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Cream Wide Leg Pants",
  //   subTitle: "Modern Relaxed Fit",
  //   image: "https://loremflickr.com/500/600/cream,wideleg,pants/all?lock=73",
  //   price: "649",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Beige Casual Pants",
  //   subTitle: "Lightweight Cotton Pants",
  //   image: "https://loremflickr.com/500/600/beige,casual,pants/all?lock=74",
  //   price: "599",
  //   oldPrice: "699",
  //   discount: "14%",
  // ),

  // ProductModel(
  //   title: "Dark Grey Pants",
  //   subTitle: "Smart Casual Trousers",
  //   image:
  //       "https://loremflickr.com/500/600/darkgrey,pants,clothing/all?lock=75",
  //   price: "649",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Pullover Hoodie",
  //   subTitle: "Cotton Fleece Hoodie",
  //   image: "https://loremflickr.com/500/600/black,hoodie,clothing/all?lock=76",
  //   price: "749",
  //   oldPrice: "899",
  //   discount: "17%",
  // ),

  // ProductModel(
  //   title: "Grey Oversized Hoodie",
  //   subTitle: "Heavyweight Streetwear Hoodie",
  //   image: "https://loremflickr.com/500/600/grey,oversized,hoodie/all?lock=77",
  //   price: "799",
  //   isNew: true,
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "White Hoodie",
  //   subTitle: "Minimal Cotton Fleece Hoodie",
  //   image: "https://loremflickr.com/500/600/white,hoodie,clothing/all?lock=78",
  //   price: "749",
  //   oldPrice: "849",
  //   discount: "12%",
  // ),

  // ProductModel(
  //   title: "Navy Blue Hoodie",
  //   subTitle: "Warm Cotton Blend Hoodie",
  //   image: "https://loremflickr.com/500/600/navy,hoodie,clothing/all?lock=79",
  //   price: "749",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Green Hoodie",
  //   subTitle: "Relaxed Streetwear Hoodie",
  //   image: "https://loremflickr.com/500/600/green,hoodie,clothing/all?lock=80",
  //   price: "749",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Brown Hoodie",
  //   subTitle: "Soft Fleece Winter Hoodie",
  //   image: "https://loremflickr.com/500/600/brown,hoodie,clothing/all?lock=81",
  //   price: "749",
  //   oldPrice: "899",
  //   discount: "17%",
  // ),

  // ProductModel(
  //   title: "Cream Hoodie",
  //   subTitle: "Premium Soft Fleece",
  //   image: "https://loremflickr.com/500/600/cream,hoodie,clothing/all?lock=82",
  //   price: "799",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Red Graphic Hoodie",
  //   subTitle: "Printed Streetwear Hoodie",
  //   image: "https://loremflickr.com/500/600/red,graphic,hoodie/all?lock=83",
  //   price: "849",
  //   oldPrice: "999",
  //   discount: "15%",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Sweatshirt",
  //   subTitle: "Heavy Cotton Crewneck",
  //   image:
  //       "https://loremflickr.com/500/600/black,sweatshirt,clothing/all?lock=84",
  //   price: "649",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Grey Sweatshirt",
  //   subTitle: "Minimal Cotton Crewneck",
  //   image:
  //       "https://loremflickr.com/500/600/grey,sweatshirt,clothing/all?lock=85",
  //   price: "649",
  //   oldPrice: "749",
  //   discount: "13%",
  // ),

  // ProductModel(
  //   title: "Blue Denim Jacket",
  //   subTitle: "Classic Denim Jacket",
  //   image: "https://loremflickr.com/500/600/blue,denim,jacket/all?lock=86",
  //   price: "899",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Black Denim Jacket",
  //   subTitle: "Modern Urban Denim Jacket",
  //   image: "https://loremflickr.com/500/600/black,denim,jacket/all?lock=87",
  //   price: "899",
  //   oldPrice: "999",
  //   discount: "10%",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Bomber Jacket",
  //   subTitle: "Lightweight Modern Bomber",
  //   image: "https://loremflickr.com/500/600/black,bomber,jacket/all?lock=88",
  //   price: "999",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Green Bomber Jacket",
  //   subTitle: "Classic Lightweight Bomber",
  //   image: "https://loremflickr.com/500/600/green,bomber,jacket/all?lock=89",
  //   price: "999",
  //   oldPrice: "1199",
  //   discount: "17%",
  // ),

  // ProductModel(
  //   title: "Brown Leather Jacket",
  //   subTitle: "Classic Leather Style Jacket",
  //   image: "https://loremflickr.com/500/600/brown,leather,jacket/all?lock=90",
  //   price: "1499",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Leather Jacket",
  //   subTitle: "Premium Casual Leather Jacket",
  //   image: "https://loremflickr.com/500/600/black,leather,jacket/all?lock=91",
  //   price: "1499",
  //   oldPrice: "1699",
  //   discount: "12%",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Navy Varsity Jacket",
  //   subTitle: "Classic College Style",
  //   image: "https://loremflickr.com/500/600/navy,varsity,jacket/all?lock=92",
  //   price: "1099",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Grey Varsity Jacket",
  //   subTitle: "Modern College Jacket",
  //   image: "https://loremflickr.com/500/600/grey,varsity,jacket/all?lock=93",
  //   price: "1099",
  //   oldPrice: "1299",
  //   discount: "15%",
  // ),

  // ProductModel(
  //   title: "Olive Green Jacket",
  //   subTitle: "Casual Utility Jacket",
  //   image: "https://loremflickr.com/500/600/olive,green,jacket/all?lock=94",
  //   price: "949",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Beige Casual Jacket",
  //   subTitle: "Lightweight Everyday Jacket",
  //   image: "https://loremflickr.com/500/600/beige,casual,jacket/all?lock=95",
  //   price: "899",
  //   oldPrice: "999",
  //   discount: "10%",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "Black Cargo Shorts",
  //   subTitle: "Multi Pocket Summer Shorts",
  //   image: "https://loremflickr.com/500/600/black,cargo,shorts/all?lock=96",
  //   price: "399",
  //   isNew: true,
  // ),

  // ProductModel(
  //   title: "Blue Denim Shorts",
  //   subTitle: "Classic Summer Denim Shorts",
  //   image: "https://loremflickr.com/500/600/blue,denim,shorts/all?lock=97",
  //   price: "449",
  //   oldPrice: "499",
  //   discount: "10%",
  // ),

  // ProductModel(
  //   title: "Beige Summer Shorts",
  //   subTitle: "Lightweight Casual Shorts",
  //   image: "https://loremflickr.com/500/600/beige,summer,shorts/all?lock=98",
  //   price: "399",
  //   isExclusive: true,
  // ),

  // ProductModel(
  //   title: "White Casual Shorts",
  //   subTitle: "Cotton Summer Shorts",
  //   image: "https://loremflickr.com/500/600/white,casual,shorts/all?lock=99",
  //   price: "399",
  //   oldPrice: "449",
  //   discount: "11%",
  // ),

  // ProductModel(
  //   title: "Olive Cargo Shorts",
  //   subTitle: "Relaxed Utility Shorts",
  //   image: "https://loremflickr.com/500/600/olive,cargo,shorts/all?lock=100",
  //   price: "449",
  //   isNew: true,
  //   isExclusive: true,
  // ),
];
