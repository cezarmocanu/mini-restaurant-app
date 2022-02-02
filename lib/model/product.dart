import 'package:kitchen_it/model/workspace.dart';

class Product {
  int id;
  double price;
  String name;
  double? discount;
  Workspace workspace;

  Product({
    required this.id,
    required this.price,
    required this.name,
    this.discount,
    required this.workspace,
  });
}
