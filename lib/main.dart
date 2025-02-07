import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skincare_track/src/common/bottom_navigation_bar/bloc/bloc/bottom_navigation_bloc.dart';
import 'package:skincare_track/src/common/bottom_navigation_bar/ui/bottom_navigation.dart';
import 'package:skincare_track/src/features/routine/bloc/bloc/routine_bloc.dart';
import 'package:skincare_track/src/features/routine/camera/bloc/bloc/camera_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => RoutineBloc(),
        ),
        BlocProvider(
          create: (context) => CameraBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home:  BottomNavigationScreen(),
      ),
    );
  }
}
