import 'package:kitchen_it/menu.dart';
import 'package:kitchen_it/product.dart';

void main() {
  List<Product> mainProductList = [];

  Product mainProduct1 = Product(
    id: 0,
    price: 15,
    name: "Ciorba de vacuta",
    discount: 2,
  );
  Product mainProduct2 = Product(
    id: 1,
    price: 14,
    name: "Ciorba de perisoare",
  );
  Product mainProduct3 = Product(
    id: 2,
    price: 17,
    name: "Ciorba de burta",
  );

  mainProductList.addAll([
    mainProduct1,
    mainProduct2,
    mainProduct3,
  ]);

  List<Product> drinkProductList = [];

  Product drinkProduct1 = Product(
    id: 0,
    price: 5,
    name: "Coca-Cola",
  );
  Product drinkProduct2 = Product(
    id: 1,
    price: 6,
    name: "Fuze Tea",
  );

  drinkProductList.addAll([
    drinkProduct1,
    drinkProduct2,
  ]);

  List<Menu> menusList = [];

  Menu mainMenu = Menu(
    id: 0,
    name: "Meniu principal",
    productList: mainProductList,
  );

  Menu drinkMenu = Menu(
    id: 1,
    name: "Meniu bauturi",
    productList: drinkProductList,
  );

  menusList.addAll([
    mainMenu,
    drinkMenu,
  ]);

  for (Menu m in menusList) {
    print('${m.id} ${m.name}');
    for (Product p in m.productList) {
      print('${p.name} ${p.price} ${p.discount}');
    }
  }
}
