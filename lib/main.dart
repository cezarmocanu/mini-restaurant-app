import 'package:flutter/material.dart';
import 'package:kitchen_it/pages/home_page.dart';
import 'package:kitchen_it/pages/menu_page.dart';
import 'package:kitchen_it/pages/workspaces_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (BuildContext context) {
          return HomePage();
        },
        "/menu": (BuildContext context) {
          return MenuPage();
        },
        "/workspaces": (BuildContext context) {
          return WorkspacesPage();
        }
      },
    ),
  );
}
