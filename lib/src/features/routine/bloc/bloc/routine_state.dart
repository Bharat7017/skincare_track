part of 'routine_bloc.dart';

abstract class RoutineState extends Equatable {
  const RoutineState();

  @override
  List<Object> get props => [];
}

class SkincareLoading extends RoutineState {}

class SkincareLoaded extends RoutineState {
  final List<DailySkincareModel> skincareData;

  const SkincareLoaded({required this.skincareData});

  @override
  List<Object> get props => [skincareData];
}

class SkincareError extends RoutineState {
  final String message;

  const SkincareError({required this.message});

  @override
  List<Object> get props => [message];
}


