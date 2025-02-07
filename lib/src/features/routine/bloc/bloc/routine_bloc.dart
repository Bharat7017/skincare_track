import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:skincare_track/src/data/daily_skincare_data.dart';
import 'package:skincare_track/src/features/routine/model/daily_skincare_model.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  RoutineBloc() : super(SkincareLoading()) {
    on<SkincareData>(_skincareData);
  }

  Future<void> _skincareData(
      SkincareData event, Emitter<RoutineState> emit) async {
    try {
      emit(SkincareLoading());

      await Future.delayed(Duration(seconds: 0));

      List<DailySkincareModel> skincareList =
          DailySkincareData.skinCareData.map((data) {
        return DailySkincareModel(
          id: data['id'],
          title: data['name'] ?? data['title'],
          subtitle: data['description'] ?? data['subtitle'],
          time: data['time'],
        );
      }).toList();

      emit(SkincareLoaded(skincareData: skincareList));
    } catch (e) {
      emit(SkincareError(message: "Failed to load data"));
    }
  }
}
