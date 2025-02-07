part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final int selectedIndex;

  const BottomNavigationState({this.selectedIndex = 0}); // Default to 0

  @override
  List<Object> get props => [selectedIndex];
}
