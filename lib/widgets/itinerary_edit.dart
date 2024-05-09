import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/constants/constants.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';
import 'package:intellij_tourism_designer/helpers/itinerary_builder.dart';
//import 'package:intellij_tourism_designer/helpers/POI_builder.dart';

//编辑行程

class ItiEditWidget extends StatefulWidget {
  final Itinerary curIti;
  const ItiEditWidget({required this.curIti,super.key});

  @override
  State<ItiEditWidget> createState() => _ItiEditWidgetState();
}

class _ItiEditWidgetState extends State<ItiEditWidget> {
  late final Itinerary curIti=widget.curIti;
  int curDay=0;
  _ItiEditWidgetState();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children:[
        Flexible(
          flex:1,
          child:Container(
            color:AppColors1.primaryColor,
            child:Column(
              children: [
                const SizedBox(height:40),
                SizedBox(
                  height:curIti.days.length*32>size.width-80 ?
                    size.width-80 : curIti.days.length*32+10,
                  child: ListView(
                    children:List.generate(curIti.days.length,(index)=>
                      TextButton(
                        onPressed:(){setState(() {curDay=index;});},
                        style:curDay==index?AppButton.button2:AppButton.button1,
                        child:Text("Day${index+1}"),
                      )
                    )
                  ),
                ),
                TextButton(
                  onPressed:(){
                    curIti.days.add([]);curIti.weathers.add(sampleWeather);
                    Provider.of<ShareDataPage>(context,listen:false).changeCurIti(curIti);
                    setState(() {curDay=curIti.days.length-1;});
                    },
                  style:AppButton.button1,
                  child:const Text("Add"),
                )
              ],
            )
          )
        ),
        Flexible(
          flex:5,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children:[
              const SizedBox(height:5),
              Container(
                width:280,height:100,
                color:AppColors1.primaryColor3,
                child: weatherView(curIti.weathers[curDay])
              ),
                const SizedBox(height:5),
                SizedBox(
                  height:500,
                  child: ListView(
                    children:List.generate(curIti.days[curDay].length,(index)=>
                      ActCard1(curAct: curIti.days[curDay][index])
                    )
                  ),
                ),
                TextButton(
                  onPressed:(){
                    curIti.days[curDay].add(sampleAct);
                    Provider.of<ShareDataPage>(context,listen:false).changeCurIti(curIti);
                    setState((){});
                  },
                  style:AppButton.button1,
                  child:const Icon(Icons.add),
                )
              ]
            )
          )

      ]
    );
  }

  Widget weatherView(Weather curWea){
    return const Row(
      children:[
        Flexible(
          flex:3,
          child:Icon(Icons.sunny,color:AppColors1.primaryColor),
        ),
        Flexible(
          flex:5,
          child:Column(
            children:[
              Text("时间",style: AppText.big),
              Text("天气",style: AppText.big),
              Text("温度",style: AppText.big),
            ]
          )
        )
      ]
    );
  }
}
