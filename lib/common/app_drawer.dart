import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Go to menu page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/menu",
                (route) {
                  return false;
                },
              );
            },
          ),
          ElevatedButton(
            child: Text("Go to home page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/home",
                (route) {
                  return false;
                },
              );
            },
          ),
          ElevatedButton(
            child: Text("Go to workspaces page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/workspaces",
                (route) {
                  return false;
                },
              );
            },
          ),
          ElevatedButton(
            child: Text("Go to tables page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/tables",
                (route) {
                  return false;
                },
              );
            },
          ),
          ElevatedButton(
            child: Text("Go to login page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/login",
                (route) {
                  return false;
                },
              );
            },
          ),
          ElevatedButton(
            child: Text("Go to profile page"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/profile",
                (route) {
                  return false;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
