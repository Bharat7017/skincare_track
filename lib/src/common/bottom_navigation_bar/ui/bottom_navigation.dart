import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skincare_track/src/utils/image_assets.dart';
import 'package:skincare_track/src/common/bottom_navigation_bar/bloc/bloc/bottom_navigation_bloc.dart';
import 'package:skincare_track/src/features/routine/ui/routine_screen.dart';
import 'package:skincare_track/src/features/streak/ui/streak_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final List<Widget> _screens = [
    const RoutineScreen(),
    const StreakScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return _screens[
              state.selectedIndex]; 
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return CustomBottomNavigationBar(
            currentIndex: state.selectedIndex, 
            onItemTapped: (index) {
              context
                  .read<BottomNavigationBloc>()
                  .add(BottomNavigationChanged(index:index)); 
            },
          );
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300))),
      height: 90,
     
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomNavigationBarItem(
            unsectedicon: AssetImage(ImageAssets.routine),
            selectedicon: AssetImage(ImageAssets.routine),
            isSelected: currentIndex == 0,
            onTap: () => onItemTapped(0),
            label: 'Routine',
          ),
          SizedBox(width: 30,),
          BottomNavigationBarItem(
            unsectedicon: AssetImage(ImageAssets.streak),
            selectedicon: AssetImage(ImageAssets.streak),
            isSelected: currentIndex == 1,
            onTap: () => onItemTapped(1),
            label: 'Streak',
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  final ImageProvider selectedicon;
  final ImageProvider unsectedicon;
  final bool isSelected;
  final VoidCallback onTap;
  final String label;

  const BottomNavigationBarItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.selectedicon,
    required this.unsectedicon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: isSelected ? selectedicon : unsectedicon,
            height: 18,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(150, 79, 102, 1),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
