import 'package:kitchen_it/repo_mock/product_repo.dart';

class ProductService {
  static Map<String, dynamic> getTheMostExpensiveProduct(List<Map<String, dynamic>> productList) {
    List<Map<String, dynamic>> productList = ProductRepo.getAll();
    Map<String, dynamic> theMostExpensive = productList[0];
    for (Map<String, dynamic> product in productList) {
      if (theMostExpensive["price"] < product["price"]) {
        theMostExpensive = product;
      }
    }
    return theMostExpensive;
  }

  static List<Map<String, dynamic>> getCheaperThanXProducts(List<Map<String, dynamic>> productList, double limitPrice) {
    List<Map<String, dynamic>> productCheaper = [];

    for (Map<String, dynamic> product in productList) {
      if (product["price"] < limitPrice) {
        productCheaper.add(product);
      }
    }

    return productCheaper;
  }

  static List<Map<String, dynamic>> getExpensiveThanXProducts(List<Map<String, dynamic>> productList, double lowerLimit) {
    List<Map<String, dynamic>> productExpensive = [];

    for (Map<String, dynamic> product in productList) {
      if (product["price"] > lowerLimit) {
        productExpensive.add(product);
      }
    }
    return productExpensive;
  }

  static List<Map<String, dynamic>> getBetweenXandYProduct(List<Map<String, dynamic>> producList, double lowerLimit, double upperLimit) {
    List<Map<String, dynamic>> productBetween = [];

    for (Map<String, dynamic> product in producList) {
      if (product["price"] < upperLimit && product["price"] > lowerLimit) {
        productBetween.add(product);
      }
    }

    return productBetween;
  }

  static List<Map<String, dynamic>> getProductWorkspace(List<Map<String, dynamic>> productList, int workspaceId) {
    List<Map<String, dynamic>> productFromWorkSpace = [];

    for (Map<String, dynamic> product in productList) {
      if (product["workspaceId"] == workspaceId) {
        productFromWorkSpace.add(product);
      }
    }
    return productFromWorkSpace;
  }

  static List<Map<String, dynamic>> getProductMenu(List<Map<String, dynamic>> productList, int menuId) {
    List<Map<String, dynamic>> productFromMenu = [];

    for (Map<String, dynamic> product in productList) {
      if (product["menuId"] == menuId) {
        productFromMenu.add(product);
      }
    }
    return productFromMenu;
  }

  static Map<String, dynamic> getTheCheapestProduct(List<Map<String, dynamic>> productList) {
    Map<String, dynamic> cheapest = productList[0];
    for (Map<String, dynamic> product in productList) {
      if (cheapest["price"] > product["price"]) {
        cheapest = product;
      }
    }
    return cheapest;
  }
}
