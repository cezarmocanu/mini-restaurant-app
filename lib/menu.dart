import 'package:kitchen_it/product.dart';

class Menu {
  int id;
  String name;
  List<Product> productList = [];

  Menu({
    required this.id,
    required this.name,
    required this.productList,
  });
}
