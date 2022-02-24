import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/data/data_event.dart';
import 'package:kitchen_it/bloc/data/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  Random random = Random();
  DataBloc() : super(DataInitial()) {
    on<GetData>(_onGetData);
  }

  _onGetData(GetData event, emit) async {
    emit(DataLoading());

    //response =  await EmployeeService.getAll()  -> Response

    //if response.status == 200
    //   employeeList = (json.decode(response.body) as List).map((json) => Employee.fromJson(json)).toList()
    //   emit(DataSuccess(employeeList))
    //else
    //   emit(DataError(response.status))

    await Future.delayed(Duration(seconds: 1));
    if (random.nextInt(100) < 20) {
      emit(DataError(random.nextInt(100) + 400));
    } else {
      emit(DataSuccess(event.name));
    }
  }
}
