import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/widgets/MapView.dart';
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
        MapWidget(),
        Positioned(
          right:20,top:20,width:340,height:100,
          child: Card(
            color:AppColors1.primaryColor3,
            child:WeatherCard1(curWea:SampleWeather)
          )
        )
      ]
    );
  }
}
