import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';

class CityStatsPage extends StatefulWidget {
  const CityStatsPage({super.key});

  @override
  State<CityStatsPage> createState() => _CityStatsPageState();
}

class _CityStatsPageState extends State<CityStatsPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget>[
        Column(
          children:<Widget>[
            Row(),
            //BarChart(BarChartData())
          ]
        ),
        Column(
          children:<Widget>[
            
          ]
        )
      ]
    );
  }
}



