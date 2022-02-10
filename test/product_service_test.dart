import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/services/product_service.dart';

void main() {
  test("Should return the most expensive product of our list", () {
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
    Map<String, dynamic> actualResult = ProductService.getTheMostExpensiveProduct(testData);
    expect(actualResult["price"], 100.0);
  });

  test("Should return a list with 2 products cheaper than 90.0", () {
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

  test("Should return an empty list in case there are no products cheaper than 20", () {
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

  test("Should return a list of products expensive than 45.0", () {
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
    List<Map<String, dynamic>> actualResult = ProductService.getExpensiveThanXProducts(testData, 45.0);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 24);
    expect(actualResult[1]["id"], 25);
  });

  test("Should return an empty list of products that are expensive than 45.0", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 23,
        "price": 44.0,
        "name": "10 Party Shots",
        "workspaceId": 1,
        "menuId": 0,
      },
    ];
    List<Map<String, dynamic>> actualResult = ProductService.getExpensiveThanXProducts(testData, 45.0);
    expect(actualResult.length, 0);
  });

  test("Should return a product with price between 19.0 & 45.0", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 20,
        "price": 18.0,
        "name": "Brioche À Tête",
        "workspaceId": 2,
        "menuId": 3,
      },
      {
        "id": 21,
        "price": 30.0,
        "name": "Super Quatro Formagi",
        "workspaceId": 0,
        "menuId": 0,
      },
      {
        "id": 22,
        "price": 50.0,
        "name": "Heavy Burger Family",
        "workspaceId": 0,
        "menuId": 0,
      },
      {
        "id": 23,
        "price": 44.0,
        "name": "10 Party Shots",
        "workspaceId": 1,
        "menuId": 0,
      },
    ];

    List<Map<String, dynamic>> actualResult = ProductService.getBetweenXandYProduct(testData, 19.0, 45.0);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 21);
    expect(actualResult[1]["id"], 23);
  });

  test("Should return an empty list of products with price between 10.0 & 15.0", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 20,
        "price": 18.0,
        "name": "Brioche À Tête",
        "workspaceId": 2,
        "menuId": 3,
      },
      {
        "id": 21,
        "price": 30.0,
        "name": "Super Quatro Formagi",
        "workspaceId": 0,
        "menuId": 0,
      },
      {
        "id": 22,
        "price": 50.0,
        "name": "Heavy Burger Family",
        "workspaceId": 0,
        "menuId": 0,
      },
      {
        "id": 23,
        "price": 44.0,
        "name": "10 Party Shots",
        "workspaceId": 1,
        "menuId": 0,
      },
    ];
    List<Map<String, dynamic>> actualResult = ProductService.getBetweenXandYProduct(testData, 10.0, 15.0);
    expect(actualResult.length, 0);
  });

  test("Should return a list of 2 products with workspaceId 1", () {
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

  test("Should return an empty list because the workspaceId is 3", () {
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

  test("Should return a list of products for menuId 1", () {
    List<Map<String, dynamic>> testData = [
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
      },
    ];

    List<Map<String, dynamic>> actualResult = ProductService.getProductMenu(testData, 1);
    expect(actualResult.length, 2);
    expect(actualResult[0]["id"], 5);
    expect(actualResult[1]["id"], 6);
  });
  test("Should return an empty list for menuId 3", () {
    List<Map<String, dynamic>> testData = [
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
      },
    ];

    List<Map<String, dynamic>> actualResult = ProductService.getProductMenu(testData, 3);
    expect(actualResult.length, 0);
  });

  test("Should return the cheapest product from a list map", () {
    List<Map<String, dynamic>> testData = [
      {
        "id": 0,
        "price": 10.0,
        "name": "Vegetable Soup",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 1,
        "price": 9.0,
        "name": "Mushroom Soup",
        "workspaceId": 0,
        "menuId": 1,
      },
      {
        "id": 2,
        "price": 8.0,
        "name": "French Fries",
        "workspaceId": 0,
        "menuId": 1,
      },
    ];

    Map<String, dynamic> actualResult = ProductService.getTheCheapestProduct(testData);
    expect(actualResult["price"], 8.0);
  });
}
