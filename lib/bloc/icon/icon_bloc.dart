import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitchen_it/bloc/icon/icon_event.dart';
import 'package:kitchen_it/bloc/icon/icon_state.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  Random random = Random();
  IconBloc() : super(IconInitial()) {
    on<GetIcon>(_onGetIcon);
  }

  _onGetIcon(event, emit) async {
    emit(IconLoading());

    await Future.delayed(Duration(seconds: 1));
    if (random.nextInt(100) < 20) {
      emit(IconError());
    } else {
      emit(IconSuccess(event.icon));
    }
  }
}
