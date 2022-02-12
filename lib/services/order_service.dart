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

  static double getPriceOfOrder(List<Map<String, dynamic>> orderItems, Map<String, dynamic> order, List<Map<String, dynamic>> products) {
    List<Map<String, dynamic>> items = getOrderItemsOfOrder(order, orderItems);
    double orderPrice = 0.0;
    for (Map<String, dynamic> item in items) {
      orderPrice += item["quantity"] * getProductOfOrderItem(item, products)["price"];
    }
    return orderPrice;
  }

  static double getTotalPriceOfOrders(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, List<Map<String, dynamic>> products) {
    double totalOrdersPrice = 0.0;
    for (Map<String, dynamic> order in orders) {
      totalOrdersPrice += getPriceOfOrder(orderItems, order, products);
    }
    return totalOrdersPrice;
  }

  static double getAveragePriceOfOrders(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, List<Map<String, dynamic>> products) {
    return getTotalPriceOfOrders(orderItems, orders, products) / orders.length;
  }

  static Map<String, dynamic> getHighestPriceOrder(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, List<Map<String, dynamic>> products) {
    Map<String, dynamic> highestOrderPrice = orders[0];
    for (Map<String, dynamic> order in orders) {
      if (getPriceOfOrder(orderItems, highestOrderPrice, products) < getPriceOfOrder(orderItems, order, products)) {
        highestOrderPrice = order;
      }
    }
    return highestOrderPrice;
  }

  static Map<String, dynamic> getLowestPriceOrder(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, List<Map<String, dynamic>> products) {
    Map<String, dynamic> lowestOrderPrice = orders[0];
    for (Map<String, dynamic> order in orders) {
      if (getPriceOfOrder(orderItems, lowestOrderPrice, products) > getPriceOfOrder(orderItems, order, products)) {
        lowestOrderPrice = order;
      }
    }
    return lowestOrderPrice;
  }

  static List<Map<String, dynamic>> getOrdersOfTable(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, Map<String, dynamic> table) {
    List<Map<String, dynamic>> ordersTable = [];
    for (Map<String, dynamic> order in orders) {
      if (table["id"] == order["idTable"]) {
        ordersTable = (getOrderItemsOfOrder(order, orderItems));
      }
    }
    return ordersTable;
  }

  static List<List<int>> getAllOrdersOfTables(List<Map<String, dynamic>> orderItems, List<Map<String, dynamic>> orders, List<Map<String, dynamic>> tables) {
    List<List<int>> result = [];
    for (Map<String, dynamic> table in tables) {
      List<int> subResult = [];
      subResult.add(table["id"]);
      subResult.add(getOrdersOfTable(orderItems, orders, table).length);
      result.add(subResult);
    }
    return result;
  }
}
