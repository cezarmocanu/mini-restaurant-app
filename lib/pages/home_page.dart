import 'package:flutter/material.dart';
import 'package:kitchen_it/common/app_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Text("This is homepage"),
          ],
        ),
      ),
    );
  }
}
