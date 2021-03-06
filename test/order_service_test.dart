import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/services/order_service.dart';

void main() {
  test("Should return a list of products for order id 76", () {
    Map<String, dynamic> testOrder = {
      "id": 76,
      "idTable": 2,
      "status": "DONE",
      "createdTime": 1644500432764,
      "preparedTime": 1644501812764,
    };

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 94,
        "productId": 20,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> actualResult = OrderService.getOrderItemsOfOrder(testOrder, testProducts);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 0);
    expect(actualResult[1]["id"], 2);
  });

  test("Should return an empty list for order id 17", () {
    Map<String, dynamic> testOrder = {
      "id": 17,
      "idTable": 2,
      "status": "DONE",
      "createdTime": 1644500432764,
      "preparedTime": 1644501812764,
    };

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 94,
        "productId": 20,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> actualResult = OrderService.getOrderItemsOfOrder(testOrder, testProducts);
    expect(actualResult.length, 0);
  });

  test("Should return a map where idProduct is the same as itemOrderId = 6", () {
    Map<String, dynamic> testOrderItem = {
      "id": 4,
      "orderId": 64,
      "productId": 6,
      "quantity": 5,
    };

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 7,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];

    Map<String, dynamic> actualResult = OrderService.getProductOfOrderItem(testOrderItem, testProducts);
    expect(actualResult["id"], 6);
  });

  test("Should return a list of products that belongs to order Id 76", () {
    Map<String, dynamic> testOrder = {
      "id": 76,
      "idTable": 2,
      "status": "DONE",
      "createdTime": 1644500432764,
      "preparedTime": 1644501812764,
    };

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 94,
        "productId": 20,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    List<Map<String, dynamic>> actualResult = OrderService.getProductsFromOrder(testOrderItems, testOrder, testProducts);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 5);
    expect(actualResult[1]["id"], 23);
  });

  test("Should return totalPrice of products that belongs to order Id 76", () {
    Map<String, dynamic> testOrder = {
      "id": 76,
      "idTable": 2,
      "status": "DONE",
      "createdTime": 1644500432764,
      "preparedTime": 1644501812764,
    };

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 94,
        "productId": 20,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    double actualResult = OrderService.getPriceOfOrder(testOrderItems, testOrder, testProducts);
    expect(actualResult, 115.0);
  });

  test("Should return totalOrdersPrice of orders that belongs today", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    double actualResult = OrderService.getTotalPriceOfOrders(testOrderItems, testOrders, testProducts);
    expect(actualResult, 140.0);
  });

  test("Should return average price of orders that belongs today", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    double actualResult = OrderService.getAveragePriceOfOrders(testOrderItems, testOrders, testProducts);
    expect(actualResult, 70.0);
  });

  test("Should return the order with the highest price that belongs today", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    Map<String, dynamic> actualResult = OrderService.getHighestPriceOrder(testOrderItems, testOrders, testProducts);
    expect(actualResult["id"], 76);
  });

  test("Should return the order with the lowest price that belongs today", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testProducts = [
      {
        "id": 5,
        "price": 7.0,
        "name": "Baked Potato",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 23,
        "price": 12.0,
        "name": "Sunny Tea",
        "workspaceId": 1,
        "menuId": 2,
      }
    ];
    Map<String, dynamic> actualResult = OrderService.getLowestPriceOrder(testOrderItems, testOrders, testProducts);
    expect(actualResult["id"], 77);
  });

  test("Should return a list with all orders from table 2", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    Map<String, dynamic> testTable = {
      "id": 2,
      "name": "Terasa 3",
    };

    List<Map<String, dynamic>> actualResult = OrderService.getOrdersOfTable(testOrderItems, testOrders, testTable);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 0);
    expect(actualResult[1]["id"], 2);
  });

  test("Should return a list of lists and elements for each one are idTable and number of orders", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testTables = [
      {
        "id": 2,
        "name": "Terasa 3",
      },
      {
        "id": 7,
        "name": "Interior 3",
      }
    ];
    List<List<int>> actualResult = OrderService.getAllOrdersOfTables(testOrderItems, testOrders, testTables);
    expect(actualResult[0], [2, 2]);
    expect(actualResult[1], [7, 1]);
    expect(actualResult.length, 2);
  });

  test("Should return idTable for table with the most number of orders => 2", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testTables = [
      {
        "id": 2,
        "name": "Terasa 3",
      },
      {
        "id": 7,
        "name": "Interior 3",
      }
    ];
    int actualResult = OrderService.getTableWithMostOrders(testOrderItems, testOrders, testTables);
    expect(actualResult, 2);
  });

  test("Should return idTable for table with the least number of orders => 7", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 76,
        "idTable": 2,
        "status": "DONE",
        "createdTime": 1644500432764,
        "preparedTime": 1644501812764,
      },
      {
        "id": 77,
        "idTable": 7,
        "status": "NEW",
        "createdTime": 1644500432764,
        "preparedTime": null,
      }
    ];

    List<Map<String, dynamic>> testOrderItems = [
      {
        "id": 0,
        "orderId": 76,
        "productId": 5,
        "quantity": 1,
      },
      {
        "id": 1,
        "orderId": 77,
        "productId": 6,
        "quantity": 5,
      },
      {
        "id": 2,
        "orderId": 76,
        "productId": 23,
        "quantity": 9,
      }
    ];

    List<Map<String, dynamic>> testTables = [
      {
        "id": 2,
        "name": "Terasa 3",
      },
      {
        "id": 7,
        "name": "Interior 3",
      }
    ];
    int actualResult = OrderService.getTableWithLeastOrders(testOrderItems, testOrders, testTables);
    expect(actualResult, 7);
  });

  test("Should return a list with lists of status of orders and number of them", () {
    List<Map<String, dynamic>> testOrders = [
      {
        "id": 82,
        "idTable": 1,
        "status": "DONE",
        "createdTime": 1644500972764,
        "preparedTime": 1644501392764,
      },
      {
        "id": 83,
        "idTable": 2,
        "status": "NEW",
        "createdTime": 1644500372764,
        "preparedTime": null,
      },
      {
        "id": 84,
        "idTable": 8,
        "status": "NEW",
        "createdTime": 1644500852764,
        "preparedTime": null,
      },
      {
        "id": 85,
        "idTable": 0,
        "status": "IN_PROGRESS",
        "createdTime": 1644500672764,
        "preparedTime": null,
      },
      {
        "id": 86,
        "idTable": 5,
        "status": "NEW",
        "createdTime": 1644501092764,
        "preparedTime": null,
      }
    ];
    List<List<dynamic>> actualResult = OrderService.getNumbersOfOrdersStatus(testOrders);
    expect(actualResult.length, 3);
    expect(actualResult[0][1], 1);
    expect(actualResult[1][1], 1);
    expect(actualResult[2][1], 3);
  });
}
