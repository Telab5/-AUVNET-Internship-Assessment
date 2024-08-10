class ProductModeL {
  dynamic? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? disc;
  dynamic? discount;
  dynamic? image;
  dynamic? name;
  bool? in_favorites;
  bool? in_cart;

  ProductModeL({
    required this.id,
    required this.discount,
    required this.image,
    required this.in_cart,
    required this.in_favorites,
    required this.name,
    required this.old_price,
    required this.price,
    required this.disc,
  });
}
