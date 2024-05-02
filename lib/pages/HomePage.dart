import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/pages/DataPage.dart';
import 'package:intellij_tourism_designer/pages/ItineraryPage.dart';
import 'package:intellij_tourism_designer/pages/CompanionPage.dart';
import 'package:intellij_tourism_designer/widgets/MapView.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';

//主页，AppBar的按钮可以实现DataPage/ItineraryPage/CompanionPage的相互跳转

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectPage=3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          children:<Widget>[
            Row(
              children:<Widget>[
                Container(
                  width:90,
                  height:48,
                  child: TextButton(
                    child:Icon(Icons.abc),
                    style:_SelectPage==0?AppButton.button1:AppButton.button2,
                    onPressed:(){
                      setState((){_SelectPage=0;});
                    }
                  ),
                ),
                Container(
                  width:90,
                  height:48,
                  child: TextButton(
                    child:Icon(Icons.access_alarm),
                    style:_SelectPage==1?AppButton.button1:AppButton.button2,
                    onPressed:(){
                      setState((){_SelectPage=1;});
                    }
                  ),
                ),
                Container(
                  width:90,
                  height:48,
                  child: TextButton(
                    child:Icon(Icons.adb),
                    style:_SelectPage==2?AppButton.button1:AppButton.button2,
                    onPressed:(){
                      setState((){_SelectPage=2;});
                    }
                  ),
                )
              ]
            ),
            Divider(
              thickness: 2,
              height: 0.0,
              indent: 0.0,
              endIndent: 0.0,
              color: AppColors1.primaryColor
            ),
            Container(
              width:1440,
              height:size.height-48,
              child: IndexedStack(
                index:_SelectPage,
                children:<Widget>[
                  DataPage(),
                  ItineraryPage(),
                  CompanionPage(),
                  DemoMap()
                ]
              ),
            )
          ]
      ),
    );
  }
}




