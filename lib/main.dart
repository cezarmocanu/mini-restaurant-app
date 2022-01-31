import 'package:flutter/material.dart';
import 'package:kitchen_it/pages/home_page.dart';
import 'package:kitchen_it/pages/login_page.dart';
import 'package:kitchen_it/pages/menu_page.dart';
import 'package:kitchen_it/pages/tables_page.dart';
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
        },
        "/tables": (BuildContext context) {
          return TablesPage();
        },
        "/login": (BuildContext context) {
          return LoginPage();
        }
      },
    ),
  );
}
