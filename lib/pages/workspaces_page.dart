import 'package:flutter/material.dart';
import 'package:kitchen_it/common/app_drawer.dart';

class WorkspacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Workspaces"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Text("This is workspaces page"),
          ],
        ),
      ),
    );
  }
}
