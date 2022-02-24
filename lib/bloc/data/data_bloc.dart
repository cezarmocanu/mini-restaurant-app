import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/data/data_event.dart';
import 'package:kitchen_it/bloc/data/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  Random random = Random();
  DataBloc() : super(DataInitial()) {
    on<StartDataLoad>(_onStartDataLoad);
  }

  _onStartDataLoad(event, emit) async {
    emit(DataLoading());

    await Future.delayed(Duration(seconds: 1));
    if (random.nextInt(100) < 20) {
      emit(DataError());
    } else {
      emit(DataSuccess());
    }
  }
}
