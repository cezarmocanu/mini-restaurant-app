import 'package:flutter/material.dart';
import 'package:kitchen_it/common/app_drawer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Text("This is profile page"),
          ],
        ),
      ),
    );
  }
}
