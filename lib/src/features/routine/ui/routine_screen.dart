import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skincare_track/src/features/routine/bloc/bloc/routine_bloc.dart';
import 'package:skincare_track/src/features/routine/camera/ui/camera_button.dart';
import 'package:skincare_track/src/features/routine/model/daily_skincare_model.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RoutineBloc>().add(SkincareData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Daily Skincare',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: BlocBuilder<RoutineBloc, RoutineState>(
        builder: (context, state) {
          if (state is SkincareLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SkincareLoaded) {
            List<DailySkincareModel> skincareData = state.skincareData;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: skincareData.length,
                    itemBuilder: (context, index) {
                      var item = skincareData[index];
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          tileColor: Colors.white,
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(242, 232, 235, 1)),
                            child: Icon(
                              Icons.check,
                              color: Colors.black45,
                            ),
                          ),
                          title: Text(item.title),
                          subtitle: Text(
                            item.subtitle,
                            style: TextStyle(
                                fontSize: 13,
                                color: const Color.fromRGBO(150, 79, 102, 1)),
                          ),
                          trailing: Wrap(
                            spacing: 5,
                            children: [
                              SizedBox(width: 20, child: CameraButton()),
                              Text(
                                item.time, // Use the time from the model
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        const Color.fromRGBO(150, 79, 102, 1)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          if (state is SkincareError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Container();
        },
      ),
    );
  }
}

 