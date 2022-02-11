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
}
