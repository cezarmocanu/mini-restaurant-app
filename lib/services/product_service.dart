class ProductService {
  static Map<String, dynamic> getTheMostExpensiveProduct(List<Map<String, dynamic>> productList) {
    Map<String, dynamic> theMostExpensive = productList.reduce((current, next) => current["price"] > next["price"] ? current : next);
    return theMostExpensive;
  }

  static List<Map<String, dynamic>> getCheaperThanXProducts(List<Map<String, dynamic>> productList, double limitPrice) {
    List<Map<String, dynamic>> productCheaper = productList.map((element) => element).where((element) => element["price"] < limitPrice).toList();
    return productCheaper;
  }

  static List<Map<String, dynamic>> getExpensiveThanXProducts(List<Map<String, dynamic>> productList, double lowerLimit) {
    List<Map<String, dynamic>> productExpensive = productList.map((element) => element).where((element) => element["price"] > lowerLimit).toList();
    return productExpensive;
  }

  static List<Map<String, dynamic>> getBetweenXandYProduct(List<Map<String, dynamic>> producList, double lowerLimit, double upperLimit) {
    List<Map<String, dynamic>> productBetween = producList.map((element) => element).where((element) => element["price"] > lowerLimit && element["price"] < upperLimit).toList();
    return productBetween;
  }

  static List<Map<String, dynamic>> getProductWorkspace(List<Map<String, dynamic>> productList, int workspaceId) {
    List<Map<String, dynamic>> productFromWorkSpace = productList.map((element) => element).where((element) => element["workspaceId"] == workspaceId).toList();
    return productFromWorkSpace;
  }

  static List<Map<String, dynamic>> getProductMenu(List<Map<String, dynamic>> productList, int menuId) {
    List<Map<String, dynamic>> productFromMenu = productList.map((element) => element).where((element) => element["menuId"] == menuId).toList();
    return productFromMenu;
  }

  static Map<String, dynamic> getTheCheapestProduct(List<Map<String, dynamic>> productList) {
    Map<String, dynamic> theCheapest = productList.reduce((current, next) => current["price"] < next["price"] ? current : next);
    return theCheapest;
  }
}
