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
  //dupa ce trec prin toata lista, si compar fiecare element in parte, afisez maximul

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
  //afisam lista la final
  //daca lista este mai lunga de 1, vom afisa elementul/elementele daca este goala vom afisa lista goala

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
//afisam lista la final
//daca lista este mai lunga de 1, vom afisa elementul/elementele daca este goala vom afisa lista goala

  static getBetweenXandYProduct(List<Map<String, dynamic>> producList, double upperLimit, double lowerLimit) {
    List<Map<String, dynamic>> productBetween = [];

    for (Map<String, dynamic> product in producList) {
      if (product["price"] < upperLimit && product["price"] > lowerLimit) {
        productBetween.add(product);
      }
    }

    if (productBetween.length > 0) {
      print("Lista este:");
      for (Map<String, dynamic> product in productBetween) {
        print("${product["name"]} : ${product["price"]}");
      }
    } else {
      print("Nu exista produse mai scumpe decat ${lowerLimit} si ${upperLimit}");
    }
  }
}
