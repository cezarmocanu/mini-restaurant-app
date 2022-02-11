class OrderService {
  static List<Map<String, dynamic>> getOrderItemsOfOrder(Map<String, dynamic> order, List<Map<String, dynamic>> orderItems) {
    List<Map<String, dynamic>> orderProducts = [];

    for (Map<String, dynamic> item in orderItems) {
      if (item["orderId"] == order["id"]) orderProducts.add(item);
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

  static List<Map<String, dynamic>> getProductsFromOrder(List<Map<String, dynamic>> orderItems, Map<String, dynamic> order, List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> Items = getOrderItemsOfOrder(order, orderItems);
    List<Map<String, dynamic>> orderProducts = [];
    for (Map<String, dynamic> item in Items) orderProducts.add(getProductOrderItem(item, products));
    return orderProducts;
  }
}
