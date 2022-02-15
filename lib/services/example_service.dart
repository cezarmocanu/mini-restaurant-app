import 'dart:convert';

import 'package:kitchen_it/model/example.dart';

class ExampleService {
  /// This method solves the following problem:
  /// Write a method that receives an array of product maps, and returns a list with the first two elements of the array.
  /// In case the received list has less than two elements it returns an empty list.
  static List<Map<String, dynamic>> exampleMethod(List<Map<String, dynamic>> productList) {
    // In case the received list has less than two elements it returns an empty list
    if (productList.length < 2) {
      return [];
    }

    List<Map<String, dynamic>> result = [];

    //add first element
    result.add(productList[0]);

    //add second element
    result.add(productList[1]);

    return result;
  }

  //Traditional method

  // static List<Example> fromString(String examplesString) {
  //   List<Example> examples = [];
  //
  //   List<dynamic> exampleMaps = json.decode(examplesString);
  //
  //   for (dynamic exampleMap in exampleMaps) {
  //     examples.add(
  //       Example.fromJson(exampleMap),
  //     );
  //   }
  //
  //   return examples;
  // }

  static List<Example> fromString(String examplesString) {
    return (json.decode(examplesString) as List).map((exampleMap) => Example.fromJson(exampleMap)).toList();
  }
}
