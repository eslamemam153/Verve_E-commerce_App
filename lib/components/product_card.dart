import 'package:flutter/material.dart';
import 'package:flutter_session_1/models/product_model.dart';

final List<ProductModel> listOfProducts = [
  ProductModel(
    title: "product 1",
    subTitle: "subTitle",
    image: "assets/images/gettyimages-114091224-612x612.jpg",
    price: "300",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
  ProductModel(
    title: "product 2",
    subTitle: "subTitle",
    image: "assets/images/Sun-Glasses.jpg",
    price: "250",
  ),
];

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 328,
          width: 232,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(productModel.image),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("-10%"), Icon(Icons.favorite)],
              ),
              Row(children: [Text("New"), Text("Exclusive")]),
            ],
          ),
        ),
        Text(productModel.title, style: TextStyle(fontSize: 16)),
        Text(
          productModel.subTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          "\$${productModel.price}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
