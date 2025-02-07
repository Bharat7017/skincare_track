import 'package:flutter/material.dart';

class StreakDays extends StatelessWidget {
  const StreakDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 232, 235, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Streak Days",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Daily Streak",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "2",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            text: 'Last 30 Days  ', // First part with default style
            style: TextStyle(
                color: const Color.fromRGBO(150, 79, 102, 1),
                fontSize: 18), // Default style
            children: <TextSpan>[
              TextSpan(
                text: '+100%', // Second part with different style
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
    ],);
  }
}