import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'streak_event.dart';
part 'streak_state.dart';

class StreakBloc extends Bloc<StreakEvent, StreakState> {
  StreakBloc() : super(StreakInitial()) {
    on<StreakEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
