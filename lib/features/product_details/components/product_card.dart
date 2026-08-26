import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/model/product_model.dart';
import 'package:flutter_session_1/features/product_details/product_details_page.dart';


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
    final colorScheme = Theme.of(context).colorScheme;
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
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
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
                        backgroundColor: colorScheme.surface,
                        child: Icon(
                          widget.productModel.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 18,
                          color: widget.productModel.isFavorite
                              ? colorScheme.error
                              : colorScheme.onSurface,
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
                        color: colorScheme.error,
                        child: Text(
                          discount,
                          style: TextStyle(
                            color: colorScheme.onError,
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
                            color: colorScheme.surface,
                            child: Text(
                              "New",
                              style: TextStyle(
                                color: colorScheme.onSurface,
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
                            color: colorScheme.onSurface,
                            child: Text(
                              "Exclusive",
                              style: TextStyle(
                                color: colorScheme.surface,
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
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.productModel.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
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
                    color: oldPrice != null
                        ? colorScheme.error
                        : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 8),
                if (oldPrice != null)
                  Text(
                    "\$$oldPrice",
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
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
  ProductModel(
    title: "Purple Streetwear T-Shirt",
    subTitle: "Oversized Graphic Style",
    image: "assets/images/product_16.png",
    price: "379",
    oldPrice: "449",
    discount: "16%",
    isNew: true,
    isFavorite: false,
  ),
  ProductModel(
    title: "Mint Green T-Shirt",
    subTitle: "Lightweight Cotton T-Shirt",
    image: "assets/images/product_17.png",
    price: "329",
    isNew: true,
    isFavorite: false,
  ),
  ProductModel(
    title: "Striped Casual T-Shirt",
    subTitle: "Classic Striped Cotton Tee",
    image: "assets/images/product_18.png",
    price: "369",
    oldPrice: "429",
    discount: "14%",
    isFavorite: false,
  ),
  ProductModel(
    title: "Black Graphic T-Shirt",
    subTitle: "Urban Printed Streetwear",
    image: "assets/images/product_19.png",
    price: "379",
    isExclusive: true,
    isFavorite: false,
  ),
  ProductModel(
    title: "Beige Basic T-Shirt",
    subTitle: "Minimal Everyday Essential",
    image: "assets/images/product_20.png",
    price: "299",
    oldPrice: "349",
    discount: "14%",
    isFavorite: false,
  ),
  ProductModel(
    title: "White Oxford Shirt",
    subTitle: "Smart Casual Button Shirt",
    image: "assets/images/product_21.png",
    price: "499",
    isNew: true,
    isFavorite: false,
  ),
  ProductModel(
    title: "Black Formal Shirt",
    subTitle: "Slim Fit Formal Shirt",
    image: "assets/images/product_22.png",
    price: "549",
    oldPrice: "649",
    discount: "15%",
    isFavorite: false,
  ),
  ProductModel(
    title: "Blue Casual Shirt",
    subTitle: "Regular Fit Cotton Shirt",
    image: "assets/images/product_23.png",
    price: "449",
    isExclusive: true,
    isFavorite: false,
  ),

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
];
