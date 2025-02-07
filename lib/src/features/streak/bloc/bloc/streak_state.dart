part of 'streak_bloc.dart';

sealed class StreakState extends Equatable {
  const StreakState();
  
  @override
  List<Object> get props => [];
}

final class StreakInitial extends StreakState {}
