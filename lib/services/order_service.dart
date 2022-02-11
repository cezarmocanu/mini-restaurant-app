class OrderService {
  static List<Map<String, dynamic>> getOrderProducts(Map<String, dynamic> theOrder, List<Map<String, dynamic>> productList) {
    List<Map<String, dynamic>> orderProducts = [];

    for (Map<String, dynamic> product in productList) {
      if (product["orderId"] == theOrder["id"]) orderProducts.add(product);
    }
    return orderProducts;
  }
}
