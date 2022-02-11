class OrderService {
  static List<Map<String, dynamic>> getOrderItemsOfOrder(Map<String, dynamic> order, List<Map<String, dynamic>> orderItems) {
    List<Map<String, dynamic>> orderProducts = [];

    for (Map<String, dynamic> item in orderItems) {
      if (item["orderId"] == order["id"]) orderProducts.add(item);
    }
    return orderProducts;
  }

  static Map<String, dynamic> getProductOfOrderItem(Map<String, dynamic> orderItem, List<Map<String, dynamic>> products) {
    Map<String, dynamic> orderProduct = {};

    for (Map<String, dynamic> product in products) {
      if (product["id"] == orderItem["productId"]) orderProduct = product;
    }
    return orderProduct;
  }

  static List<Map<String, dynamic>> getProductsFromOrder(List<Map<String, dynamic>> orderItems, Map<String, dynamic> order, List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> items = getOrderItemsOfOrder(order, orderItems);
    List<Map<String, dynamic>> orderProducts = [];
    for (Map<String, dynamic> item in items) {
      orderProducts.add(getProductOfOrderItem(item, products));
    }
    return orderProducts;
  }

  static double getTotalPriceOrder(List<Map<String, dynamic>> orderItems, Map<String, dynamic> order, List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> items = getOrderItemsOfOrder(order, orderItems);
    double totalPrice = 0.0;
    for (Map<String, dynamic> item in items) {
      totalPrice += item["quantity"] * getProductOfOrderItem(item, products)["price"];
    }
    return totalPrice;
  }
}
