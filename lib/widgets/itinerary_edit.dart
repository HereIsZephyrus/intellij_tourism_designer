import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';

//编辑行程

class ItiEditWidget extends StatefulWidget {
  final Itinerary curIti;
  const ItiEditWidget({required this.curIti,super.key});

  @override
  State<ItiEditWidget> createState() => _ItiEditWidgetState(curIti:this.curIti);
}

class _ItiEditWidgetState extends State<ItiEditWidget> {
  final Itinerary curIti;
  int curDay=0;
  _ItiEditWidgetState({required this.curIti});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Flexible(
          flex:1,
          child:Container(
            color:AppColors1.primaryColor,
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                SizedBox(height:50),
                Container(
                  height:curIti.Activitices.length*36>600?600:curIti.Activitices.length*36,
                  child: ListView(
                    children:List.generate(curIti.Activitices.length,(index)=>
                      TextButton(
                        onPressed:(){setState(() {curDay=index;});},
                        child:Text("Day${index+1}"),
                        style:curDay==index?AppButton.button2:AppButton.button1
                      )
                    )
                  ),
                ),
                TextButton(
                  onPressed:(){
                    curIti.Activitices.add([]);curIti.weathers.add(SampleWeather);
                    Provider.of<ShareDataPage>(context,listen:false).ChangecurIti(this.curIti);
                    setState(() {curDay=curIti.Activitices.length-1;});
                    },
                  child:Text("Add"),
                  style:AppButton.button1
                )
              ],
            )
          )
        ),
        Flexible(
          flex:5,
          child: Container(
            color:AppColors1.backgroundColor,
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children:[
                SizedBox(height:5),
                Container(
                  width:280,height:100,
                  color:AppColors1.primaryColor3,
                  child: WeatherCard1(curWea:curIti.weathers[curDay])
                ),
                SizedBox(height:5),
                Container(
                  height:500,
                  child: ListView(
                    children:List.generate(curIti.Activitices[curDay].length,(index)=>
                      ActCard1(curAct: curIti.Activitices[curDay][index])
                    )
                  ),
                ),
                TextButton(
                  onPressed:(){
                    curIti.Activitices[curDay].add(SampleAct);
                    Provider.of<ShareDataPage>(context,listen:false).ChangecurIti(this.curIti);
                    setState((){});
                  },
                  child:Icon(Icons.add),
                  style:AppButton.button1
                )
              ]
            )
          )
        )
      ]
    );
  }
}
