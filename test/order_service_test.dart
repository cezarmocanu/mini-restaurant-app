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

    List<Map<String, dynamic>> actualResult = OrderService.getOrderProducts(testOrder, testProducts);
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

    List<Map<String, dynamic>> actualResult = OrderService.getOrderProducts(testOrder, testProducts);
    expect(actualResult.length, 0);
  });
}
