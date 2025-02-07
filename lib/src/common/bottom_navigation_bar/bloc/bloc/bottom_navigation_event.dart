part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationChanged extends BottomNavigationEvent {
  final int index;

 const BottomNavigationChanged({required this.index});

 

  @override
  List<Object> get props => [index]; 
}
