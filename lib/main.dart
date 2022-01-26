import 'package:kitchen_it/product.dart';

void main() {
  List<Product> productList = [];

  Product product1 = Product(
    id: 0,
    price: 15,
    name: "Ciorba de vacuta",
    discount: 2,
  );
  Product product2 = Product(
    id: 1,
    price: 14,
    name: "Ciorba de perisoare",
  );
  Product product3 = Product(
    id: 2,
    price: 17,
    name: "Ciorba de burta",
  );

  productList.addAll([
    product1,
    product2,
    product3,
  ]);

  for (int x = 0; x < productList.length; x++) {
    Product p = productList[x];
    print('${p.name} ${p.price} ${p.discount}');
  }

  for (Product p in productList) {
    print('${p.name} ${p.price} ${p.discount}');
  }
}
