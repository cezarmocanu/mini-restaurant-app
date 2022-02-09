import 'package:kitchen_it/repo_mock/product_repo.dart';

class ProductService {
  static void showAllProductName() {
    List<Map<String, dynamic>> productList = ProductRepo.getAll();
    for (Map<String, dynamic> productMap in productList) {
      print(productMap["name"]);
    }
  }

  static allProductCheaperThan(double price) {
    List<Map<String, dynamic>> productList = ProductRepo.getAll();
    for (Map<String, dynamic> product in productList) {
      if (product["price"] < price) {
        print("${product["name"]} : ${product["price"]}");
      }
    }
  }

  static getCheapestProduct() {
    List<Map<String, dynamic>> productList = ProductRepo.getAll();
    Map<String, dynamic> cheapestProduct = productList[0];
    for (Map<String, dynamic> product in productList) {
      if (cheapestProduct["price"] > product["price"]) {
        cheapestProduct = product;
      }
    }
    return cheapestProduct;
  }

  //static void getCheapestProduct(){
  // copiez lista initiala in lista pe care o creez in functie
  // primul devine minimul
  // trec prin toata lista
  // iau fiecare element si il compar cu minimul
  // daca este mai mic elementul devine el insasi minimul
  // dupa ce trece prin toata lista si compar toate elementele afisez minimul
  // }

  static getTheMostExpensiveProduct(List<Map<String, dynamic>> productList) {
    List<Map<String, dynamic>> productList = ProductRepo.getAll();
    Map<String, dynamic> theMostExpensive = productList[0];
    for (Map<String, dynamic> product in productList) {
      if (theMostExpensive["price"] < product["price"]) {
        theMostExpensive = product;
      }
    }
    return theMostExpensive;
  }
  //copiez lista initiala in lista pe care o creez
  //primul va deveni maximul
  //trec prin toata lista
  //iau fiecare element si il compar cu maximul daca va fi mai mare decat maximul curent, va deveni maximul
  //dupa ce trec prin toata lista, si compar fiecare element in parte, returnez maximul

  static getCheaperThanXProducts(List<Map<String, dynamic>> productList, double limitPrice) {
    List<Map<String, dynamic>> productCheaper = [];

    for (Map<String, dynamic> product in productList) {
      if (product["price"] < limitPrice) {
        productCheaper.add(product);
      }
    }

    return productCheaper;
  }
  //copiez lista initiala intr o lista creata
  //cream o instanta a unei variabile pentru a impune un pret
  //cream o lista in care vom copia elementele listei initiale care sar de pretul limita
  //trecem prin lista, element cu element, verificam daca indeplineste conditia
  //daca este, copiem elementul(map ul) in lista
  //returnam lista la final

  static getExpensiveThanXProducts(List<Map<String, dynamic>> productList, double lowerLimit) {
    List<Map<String, dynamic>> productExpensive = [];

    for (Map<String, dynamic> product in productList) {
      if (product["price"] > lowerLimit) {
        productExpensive.add(product);
      }
    }
    return productExpensive;
  }
//copiez lista initiala intr o lista creata
//cream o instanta a unei variabile pentru a impune un pret
//cream o lista in care vom copia elementele listei initiale care sunt sub pretul limita
//trecem prin lista, element cu element, verificam daca indeplineste conditia
//daca este, copiem elementul(map ul) in lista
//returnam lista la final

  static getBetweenXandYProduct(List<Map<String, dynamic>> producList, double lowerLimit, double upperLimit) {
    List<Map<String, dynamic>> productBetween = [];

    for (Map<String, dynamic> product in producList) {
      if (product["price"] < upperLimit && product["price"] > lowerLimit) {
        productBetween.add(product);
      }
    }

    return productBetween;
  }
//functie statica cu parametrii precum o lista de date, limita inferioara de pret si lim. sup.
//creeam lista noastra de maps, goala initial
//trecem prin fiecare element al listei noastre de date
//supunem fiecare element unei conditii pentru a vedea daca poate sau nu sa intre in lista noastra
//daca da il adaugam in lista
//returnam lista

  static getProductWorkspace(List<Map<String, dynamic>> productList, int workspaceId) {
    List<Map<String, dynamic>> productFromWorkSpace = [];

    for (Map<String, dynamic> product in productList) {
      if (product["workspaceId"] == workspaceId) {
        productFromWorkSpace.add(product);
      }
    }
    return productFromWorkSpace;
  }
//creeam o functie statica cu parametrii fiind o lista de date si un workspaceId
//creeam o lista auxiliara in care vom salva produsele care indeplinesc criteriul
//trecem prin lista cu ajutorul unui produs fictiv care va copia toate produsele din lista initiala
//verificam conditia, air daca o indeplineste il copiem in lista
//returnam lista

  static getProductMenu(List<Map<String, dynamic>> productList, int menuId) {
    List<Map<String, dynamic>> productFromMenu = [];

    for (Map<String, dynamic> product in productList) {
      if (product["menuId"] == menuId) {
        productFromMenu.add(product);
      }
    }
    return productFromMenu;
  }
}
//we initialize a function depends of 2 parameters, a list of products and a menuId
//second we ll create an auxiliary list
//inside a for we ll copy each product from our first list
//we ll check for each product if verify the requierment
//if the answear is yes, we ll add the element in our auxiliary list
//in the final we return the aux list
