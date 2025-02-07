import 'package:flutter/material.dart';
import 'package:skincare_track/src/features/streak/widget/get_started_button.dart';
import 'package:skincare_track/src/features/streak/widget/streak_days.dart';
import 'package:skincare_track/src/features/streak/widget/track_chart.dart';

class StreakScreen extends StatelessWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Streaks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Text(
                "Today's Goal: 3 streak days",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
             StreakDays(),
              SizedBox(
                height: 20,
              ),
              TrackChart(),
              SizedBox(
                height: 30,
              ),
              Text(
                "Keep it up! You're on a roll.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20,),
              GetStartedButton(),
                SizedBox(height: 30,)
,            ],
          ),
        ));
  }
}
