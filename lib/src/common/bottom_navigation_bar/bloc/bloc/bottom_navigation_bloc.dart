import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState()) {
    on<BottomNavigationChanged>(bottomNavigationChanged);
  }

  FutureOr<void> bottomNavigationChanged(
      BottomNavigationChanged event, Emitter<BottomNavigationState> emit) {
         emit(BottomNavigationState(selectedIndex: event.index));
      }
}
