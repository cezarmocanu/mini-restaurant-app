import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/repo_mock/product_repo.dart';
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

  test("Should give us back a list with products cheaper than", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 23,
        "price": 44.0,
        "name": "10 Party Shots",
        "workspaceId": 1,
        "menuId": 0,
      },
      {
        "id": 24,
        "price": 60.0,
        "name": "Happy Hour Party",
        "workspaceId": 2,
        "menuId": 0,
      },
      {
        "id": 25,
        "price": 100.0,
        "name": "5 Person Chocolate Cake Dessert",
        "workspaceId": 2,
        "menuId": 0,
      },
    ];
    List<Map<String, dynamic>> actualResult = ProductService.getCheaperThanXProducts(testData, 90.0);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 23);
    expect(actualResult[1]["id"], 24);
  });

  test("Should give us back a list with products cheaper than", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 23,
        "price": 44.0,
        "name": "10 Party Shots",
        "workspaceId": 1,
        "menuId": 0,
      }
    ];
    List<Map<String, dynamic>> actualResult = ProductService.getCheaperThanXProducts(testData, 20.0);
    expect(actualResult.length, 0);
  });
  //ProductService.getCheaperThanXProducts(20.0);

  //ProductService.getExpensiveThanXProducts(49.9);
}
