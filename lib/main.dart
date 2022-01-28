import 'package:kitchen_it/employee.dart';
import 'package:kitchen_it/menu.dart';
import 'package:kitchen_it/product.dart';
import 'package:kitchen_it/table.dart';
import 'package:kitchen_it/workspace.dart';

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

  List<Product> desertProductList = [];

  Product desertProduct1 = Product(
    id: 0,
    price: 12,
    name: "Tiramisu",
  );
  Product desertProduct2 = Product(
    id: 1,
    price: 14,
    name: "Lava cake",
  );

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

  Menu desertMenu = Menu(
    id: 2,
    name: "Meniu desert",
    productList: desertProductList,
  );

  desertProductList.addAll([
    desertProduct1,
    desertProduct2,
  ]);

  menusList.addAll([
    mainMenu,
    drinkMenu,
    desertMenu,
  ]);

  for (Menu m in menusList) {
    print('${m.id} ${m.name}');
    for (Product p in m.productList) {
      print('${p.name} ${p.price} ${p.discount}');
    }
  }

  List<Employee> employeeList = [];

  Employee employee1 = Employee(
    id: 0,
    firstName: "Daniel",
    lastName: "Zanoaga",
  );

  Employee employee2 = Employee(
    id: 1,
    firstName: "Alin",
    lastName: "Balint",
  );

  Employee employee3 = Employee(
    id: 2,
    firstName: "Augustin",
    lastName: "Vatra",
  );

  employeeList.addAll([
    employee1,
    employee2,
    employee3,
  ]);

  print("Angajatii firmei sunt:");
  for (Employee e in employeeList) {
    print('${e.id} ${e.firstName} ${e.lastName}');
  }

  List<Table> tableList = [];

  Table table1 = Table(
    id: 0,
    name: "terasa1",
  );

  Table table2 = Table(
    id: 1,
    name: "interior1",
  );

  Table table3 = Table(
    id: 2,
    name: "interior2",
  );

  tableList.addAll([
    table1,
    table2,
    table3,
  ]);

  print("Mese disponibile:");

  for (Table t in tableList) {
    print(t.name);
  }

  List<Workspace> workspaceList = [];

  Workspace workspace1 = Workspace(
    id: 0,
    name: "Bucatarie principala",
  );

  Workspace workspace2 = Workspace(
    id: 1,
    name: "Bar",
  );

  Workspace workspace3 = Workspace(
    id: 2,
    name: "Bucatarie desert",
  );

  workspaceList.addAll([
    workspace1,
    workspace2,
    workspace3,
  ]);
}
