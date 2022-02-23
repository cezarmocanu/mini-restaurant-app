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

                if (state is DataSuccess) {
                  return Center(
                    child: Text("Data loaded successfully"),
                  );
                }

                if (state is DataError) {
                  return Center(
                    child: Text("Data did not load correctly"),
                  );
                }

                return Center(
                  child: Text("Illgal state"),
                );
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              child: Text("Load Data"),
              onPressed: () {
                context.read<DataBloc>().add(StartDataLoad());
              },
            ),
          ],
        ),
      ),
    );
  }
}
