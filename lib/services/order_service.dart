class OrderService {
  static List<Map<String, dynamic>> getOrderItemsOfOrder(Map<String, dynamic> order, List<Map<String, dynamic>> orderItems) {
    List<Map<String, dynamic>> orderProducts = [];

    for (Map<String, dynamic> product in orderItems) {
      if (product["orderId"] == order["id"]) orderProducts.add(product);
    }
    return orderProducts;
  }

  static Map<String, dynamic> getProductOrderItem(Map<String, dynamic> orderItem, List<Map<String, dynamic>> products) {
    Map<String, dynamic> orderProduct = {};

    for (Map<String, dynamic> product in products) {
      if (product["id"] == orderItem["productId"]) orderProduct = product;
    }
    return orderProduct;
  }
}
