class Product {
  int id;
  double price;
  String name;
  double? discount;

  Product({
    required this.id,
    required this.price,
    required this.name,
    this.discount,
  });
}
