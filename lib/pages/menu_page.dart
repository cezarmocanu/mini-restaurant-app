import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_it/common/app_drawer.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Text("This is menu page"),
          ],
        ),
      ),
    );
  }
}
