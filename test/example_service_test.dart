import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/model/example.dart';
import 'package:kitchen_it/model/order.dart';
import 'package:kitchen_it/repo_mock/employee_repo.dart';
import 'package:kitchen_it/repo_mock/example_repo.dart';
import 'package:kitchen_it/repo_mock/order_item_repo.dart';
import 'package:kitchen_it/repo_mock/order_repo.dart';
import 'package:kitchen_it/repo_mock/product_repo.dart';
import 'package:kitchen_it/repo_mock/table_repo.dart';
import 'package:kitchen_it/services/example_service.dart';

void main() {
  test("Should correctly return the first two elements of the array", () {
    //We create a test scenario in which we expect the method to return the first two elements in an array as result
    List<Map<String, dynamic>> testData = [
      {
        "id": 3,
        "price": 10.0,
        "name": "Vegetable Soup",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 4,
        "price": 9.0,
        "name": "Mushroom Soup",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 5,
        "price": 8.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
    ];

    // we use the method from the service
    List<Map<String, dynamic>> actualResult = ExampleService.exampleMethod(testData);

    //we make several verifications on the actual result, to make sure everything works as expected

    //We expect that the example method correctly returns two elements
    expect(actualResult.length, 2);

    //We expect that the id of the first element from the result of test method has the same id as the first element from the testData
    expect(actualResult[0]["id"], 3);

    //We expect that the id of the second element from the result of test method has the same id as the second element from the testData
    expect(actualResult[1]["id"], 4);
  });

  //we also need to test the edge cases of the method
  test("Should correctly return an empty array in case it receives an array with less than two elements", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 3,
        "price": 10.0,
        "name": "Vegetable Soup",
        "workspaceId": 0,
        "menuId": 1,
      },
    ];

    List<Map<String, dynamic>> actualResult = ExampleService.exampleMethod(testData);

    //We expect that the example method correctly returns two elements
    expect(actualResult.length, 0);
  });

  test("Should find 8 order items in for the first order", () {
    Map<String, dynamic> order = OrderRepo.getAll()[0];
    List<Map<String, dynamic>> orderItems = OrderItemRepo.getAll().where((orderItem) => orderItem["orderId"] == order["id"]).toList();
    expect(orderItems.length, 8);
  });

  test("Should find 8 products in the first order", () {
    Map<String, dynamic> order = OrderRepo.getAll()[0];
    List<Map<String, dynamic>> orderItems = OrderItemRepo.getAll().where((orderItem) => orderItem["orderId"] == order["id"]).toList();
    List<Map<String, dynamic>> products = ProductRepo.getAll();
    List<Map<String, dynamic>> productsInOrder = orderItems.map((orderItem) => products.firstWhere((product) => product["id"] == orderItem["productId"])).toList();

    expect(productsInOrder.length, orderItems.length);
    expect(productsInOrder.length, 8);
  });

  test("Should compute all squares form the array with for loop", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];

    List<int> squares = [];

    for (int number in numbers) {
      squares.add(number * number);
    }

    expect(squares, [1, 4, 9, 16, 25, 36]);
  });

  test("Should compute all squares form the array with map hof", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    List<int> squares = numbers.map((number) => number * number).toList();

    expect(squares, [1, 4, 9, 16, 25, 36]);
  });

  //
  test("Should compute all even squares form the array with for loop", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];

    List<int> squares = [];

    for (int number in numbers) {
      int square = number * number;

      if (square % 2 == 0) {
        squares.add(square);
      }
    }

    print(squares);
    expect(squares, [4, 16, 36]);
  });

  test("Should compute all even squares form the array with map hof", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    List<int> squares = numbers.map((number) => number * number).where((number) => number % 2 == 0).toList();

    expect(squares, [4, 16, 36]);
  });

  //
  test("Should compute sum of all even squares form the array with for loop", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    List<int> squares = [];

    for (int number in numbers) {
      int square = number * number;

      if (square % 2 == 0) {
        squares.add(square);
      }
    }
    int sum = 0;
    for (int square in squares) {
      sum += square;
    }
    expect(sum, 56);
  });

  test("Should compute sum of all even squares form the array with map hof", () {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    int sum = numbers.map((number) => number * number).where((number) => number % 2 == 0).fold(0, (total, number) => total + number);

    expect(sum, 56);
  });

  test("Should deserialize examples to a map", () {
    String examplesString = ExampleRepo.getAll();
    List<Example> expected = [
      Example(
        id: 0,
        name: "Example 1",
        isActive: true,
      ),
      Example(
        id: 1,
        name: "Example 2",
        isActive: false,
      ),
      Example(
        id: 2,
        name: "Example 3",
        isActive: false,
      ),
    ];
    for (int i = 0; i < expected.length; i++) {
      expect(ExampleService.fromString(examplesString).elementAt(i).id, expected.elementAt(i).id);
    }
  });
}
