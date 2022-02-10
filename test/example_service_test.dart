import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/service/example_service.dart';

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

  test("Should fail a test", () {
    expect(1, 2);
  });
}
