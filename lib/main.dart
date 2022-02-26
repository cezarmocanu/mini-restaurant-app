import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/data/data_bloc.dart';
import 'package:kitchen_it/bloc/icon/icon_bloc.dart';
import 'package:kitchen_it/pages/data_page.dart';
import 'package:kitchen_it/pages/home_page.dart';
import 'package:kitchen_it/pages/login_page.dart';
import 'package:kitchen_it/pages/menu_page.dart';
import 'package:kitchen_it/pages/profile_page.dart';
import 'package:kitchen_it/pages/tables_page.dart';
import 'package:kitchen_it/pages/workspaces_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/data",
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
        },
        "/profile": (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<IconBloc>(create: (BuildContext context) => IconBloc()),
            ],
            child: ProfilePage(),
          );
        },
        "/data": (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<DataBloc>(
                create: (BuildContext context) => DataBloc(),
              ),
            ],
            child: DataPage(),
          );
        }
      },
    ),
  );
}
