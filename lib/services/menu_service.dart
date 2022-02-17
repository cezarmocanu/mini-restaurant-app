import 'dart:convert';

import 'package:kitchen_it/model/menu.dart';

class MenuSrevice {
  static List<Menu> fromString(String menuString) {
    // List<Map<String, dynamic>> menus = [];
    // for(Map<String, dynamic> menuMap in (json.decode(menuString)) as List){
    //   menus.add(Menu.fromJson(menuMap));
    // } ?????
    return (json.decode(menuString) as List).map((menuMap) => Menu.fromJson(menuMap)).toList();
  }
}
