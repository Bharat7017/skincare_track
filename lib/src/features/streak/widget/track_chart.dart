import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

class TrackChart extends StatelessWidget {
  const TrackChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 230,
      child: Chart(
        layers: [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.5,

            max: 7.0,
            min: 1.0,
           
            textStyle: TextStyle(
              color: Color.fromRGBO(150, 79, 102, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              ),
            ),
            y: ChartAxisSettingsAxis(
              frequency: 30.0,
              max: 300.0,
              min: 0.0,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
          labelX: (value) => value.toInt().toString(),
          labelY: (value) => value.toInt().toString(),
        ),
        ChartLineLayer(
          items: List.generate(
            7 - 1 + 1,
            (index) => ChartLineDataItem(
              value: Random().nextInt(280) + 20,
              x: index.toDouble() + 1,
            ),
          ),
          settings: const ChartLineSettings(
            thickness: 4.0,
             color:  Color.fromRGBO(150, 79, 102, 1),
          ),
        ),
        
      ]
        
      ),
    );
  }
}