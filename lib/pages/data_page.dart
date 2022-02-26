import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/data/data_bloc.dart';
import 'package:kitchen_it/bloc/data/data_event.dart';
import 'package:kitchen_it/bloc/data/data_state.dart';
import 'package:kitchen_it/common/app_drawer.dart';
import 'package:provider/src/provider.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Data"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            const SizedBox(height: 100),
            BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                //type GUARD
                if (state is DataSuccess) {
                  return Center(
                    child: Text("Data loaded ${state.name}"),
                  );
                }

                if (state is DataError) {
                  return Center(
                    child: Text("Data did not load error ${state.errorCode}"),
                  );
                }

                return Center(
                  child: Text("Illgal state"),
                );
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              child: Text("Load Data for Cezar"),
              onPressed: () {
                context.read<DataBloc>().add(GetData("Cezar"));
              },
            ),
            ElevatedButton(
              child: Text("Load Data for Coste"),
              onPressed: () {
                context.read<DataBloc>().add(GetData("Coste"));
              },
            ),
            ElevatedButton(
              child: Text("Load Data for Marian"),
              onPressed: () {
                context.read<DataBloc>().add(GetData("Marian"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
