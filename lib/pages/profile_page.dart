import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/icon/icon_bloc.dart';
import 'package:kitchen_it/bloc/icon/icon_event.dart';
import 'package:kitchen_it/bloc/icon/icon_state.dart';
import 'package:kitchen_it/common/app_drawer.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Text("Let's see what icon do you wanna"),
            BlocBuilder<IconBloc, IconState>(
              builder: (context, state) {
                if (state is IconLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is IconSuccess) {
                  if (state.icon == "musical") {
                    return Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    );
                  } else {
                    if (state.icon == "heart") {
                      return Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 30.0,
                        ),
                      );
                    } else {
                      return Center(
                        child: Icon(
                          Icons.beach_access,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      );
                    }
                  }
                }
                if (state is IconError) {
                  return Center(
                    child: Text("Sorry, may you try again? :)"),
                  );
                }
                return Center(
                  child: Text("Let's start, try one"),
                );
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  context.read<IconBloc>().add(GetIcon("heart"));
                },
                child: Text("Load a heart")),
            ElevatedButton(
                onPressed: () {
                  context.read<IconBloc>().add(GetIcon("musical"));
                },
                child: Text("Load a musical note ")),
            ElevatedButton(
                onPressed: () {
                  context.read<IconBloc>().add(GetIcon("umbrella"));
                },
                child: Text("Load an umbrella"))
          ],
        ),
      ),
    );
  }
}
