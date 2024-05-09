import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/widgets/map_view.dart';
import 'package:intellij_tourism_designer/constants/constants.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';
//import 'package:intellij_tourism_designer/helpers/itinerary_builder.dart';

//大概是人已经在路上的模块，还没想好叫什么名字

class CompanionPage extends StatefulWidget {
  const CompanionPage({super.key});

  @override
  State<CompanionPage> createState() => _CompanionPageState();
}

class _CompanionPageState extends State<CompanionPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        const DemoMap(),
        Positioned(
          right:20,top:20,width:340,height:100,
          child: Card(
            color:AppColors1.primaryColor3,
            child:WeatherCard1(curWea:sampleWeather)
          )
        )
      ]
    );
  }
}
