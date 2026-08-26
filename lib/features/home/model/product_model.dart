class ProductModel {
  final String title;
  final String subTitle;
  final String image;
  final String price;
  final String? oldPrice;
  final String? discount;
  final bool isNew;
  final bool isExclusive;
  bool isFavorite; 

  ProductModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.price,
    this.oldPrice,
    this.discount,
    this.isNew = false,
    this.isExclusive = false,
    this.isFavorite = false, 
  });
}

final List<ProductModel> cartItems = [];
