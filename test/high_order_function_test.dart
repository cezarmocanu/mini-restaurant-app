import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/services/product_service.dart';

int sum(int a, int b) {
  return a + b;
}

void main() {
  test("Should 5+6 result 11", () {
    var result = sum(5, 6);

    expect(result, 11);
  });

  //ProductService.showAllProductName();

  //ProductService.allProductCheaperThan(10.0);

  //ProductService.getCheapestProduct();

  // test("Should return the most expensive product of our list", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 24,
  //       "price": 60.0,
  //       "name": "Happy Hour Party",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 25,
  //       "price": 100.0,
  //       "name": "5 Person Chocolate Cake Dessert",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //   ];
  //   Map<String, dynamic> actualResult = ProductService.getTheMostExpensiveProduct(testData);
  //   expect(actualResult["price"], 100.0);
  // });
  //ProductService.getTheMostExpensiveProduct();

  // test("Should give us back a list with products cheaper than", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 24,
  //       "price": 60.0,
  //       "name": "Happy Hour Party",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 25,
  //       "price": 100.0,
  //       "name": "5 Person Chocolate Cake Dessert",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //   ];
  //   List<Map<String, dynamic>> actualResult = ProductService.getCheaperThanXProducts(testData, 90.0);
  //   expect(actualResult.length, 2);
  //   expect(actualResult[0]["id"], 23);
  //   expect(actualResult[1]["id"], 24);
  // });
  //
  // test("Should give us back a list with products cheaper than", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     }
  //   ];
  //   List<Map<String, dynamic>> actualResult = ProductService.getCheaperThanXProducts(testData, 20.0);
  //   expect(actualResult.length, 0);
  // });
  //ProductService.getCheaperThanXProducts(20.0);

  // test("Should give us products that are expensive than the limit", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 24,
  //       "price": 60.0,
  //       "name": "Happy Hour Party",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 25,
  //       "price": 100.0,
  //       "name": "5 Person Chocolate Cake Dessert",
  //       "workspaceId": 2,
  //       "menuId": 0,
  //     },
  //   ];
  //   List<Map<String, dynamic>> actualResult = ProductService.getExpensiveThanXProducts(testData, 45.0);
  //   expect(actualResult.length, 2);
  //   expect(actualResult[0]["id"], 24);
  //   expect(actualResult[1]["id"], 25);
  // });
  //
  // test("Should give us products that are expensive than the limit", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //   ];
  //   List<Map<String, dynamic>> actualResult = ProductService.getExpensiveThanXProducts(testData, 45.0);
  //   expect(actualResult.length, 0);
  // });
  //ProductService.getExpensiveThanXProducts(49.9);

  // test("Should give us back a list that have products with price between 2 parameters", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 20,
  //       "price": 18.0,
  //       "name": "Brioche À Tête",
  //       "workspaceId": 2,
  //       "menuId": 3,
  //     },
  //     {
  //       "id": 21,
  //       "price": 30.0,
  //       "name": "Super Quatro Formagi",
  //       "workspaceId": 0,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 22,
  //       "price": 50.0,
  //       "name": "Heavy Burger Family",
  //       "workspaceId": 0,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //   ];
  //
  //   List<Map<String, dynamic>> actualResult = ProductService.getBetweenXandYProduct(testData, 19.0, 45.0);
  //   expect(actualResult.length, 2);
  //   expect(actualResult[0]["id"], 21);
  //   expect(actualResult[1]["id"], 23);
  // });
  //
  // test("Should give us back a list that have products with price between 2 parameters", () {
  //   List<Map<String, dynamic>> testData = [
  //     {
  //       "id": 20,
  //       "price": 18.0,
  //       "name": "Brioche À Tête",
  //       "workspaceId": 2,
  //       "menuId": 3,
  //     },
  //     {
  //       "id": 21,
  //       "price": 30.0,
  //       "name": "Super Quatro Formagi",
  //       "workspaceId": 0,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 22,
  //       "price": 50.0,
  //       "name": "Heavy Burger Family",
  //       "workspaceId": 0,
  //       "menuId": 0,
  //     },
  //     {
  //       "id": 23,
  //       "price": 44.0,
  //       "name": "10 Party Shots",
  //       "workspaceId": 1,
  //       "menuId": 0,
  //     },
  //   ];
  //   List<Map<String, dynamic>> actualResult = ProductService.getBetweenXandYProduct(testData, 10.0, 15.0);
  //   expect(actualResult.length, 0);
  // });

  test("Should test if the mock data has the same workspaceid", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 14,
        "price": 13.0,
        "name": "Ice Frappe",
        "workspaceId": 1,
        "menuId": 2,
      },
      {
        "id": 15,
        "price": 18.0,
        "name": "Marshmallow Vanilla Caffe",
        "workspaceId": 1,
        "menuId": 2,
      },
    ];

    List<Map<String, dynamic>> actualResult = ProductService.getProductWorkspace(testData, 1);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 14);
    expect(actualResult[1]["id"], 15);
  });

  test("Should test if the mock data has the same workspaceid", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 6,
        "price": 5.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 14,
        "price": 13.0,
        "name": "Ice Frappe",
        "workspaceId": 1,
        "menuId": 2,
      },
      {
        "id": 15,
        "price": 18.0,
        "name": "Marshmallow Vanilla Caffe",
        "workspaceId": 1,
        "menuId": 2,
      },
    ];

    List<Map<String, dynamic>> actualResult = ProductService.getProductWorkspace(testData, 2);
    expect(actualResult.length, 0);
  });
}
