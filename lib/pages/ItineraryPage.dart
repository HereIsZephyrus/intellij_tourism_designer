import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:intellij_tourism_designer/Provider/DataModel.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/widgets/ItiEdit.dart';
import 'package:intellij_tourism_designer/widgets/MapView.dart';
import 'package:intellij_tourism_designer/widgets/ItiFeature.dart';

//行程规划模块

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  int curState=0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children:[
        curState==2?Container():Container(
          height:size.height-48,
          width:150,
          color:AppColors1.primaryColor,
          child: Column(
              children:<Widget>[
                Container(
                  width:150,
                  height:42,
                  child: TextButton(
                      child:Text("我的规划"),
                      style:curState==1?AppButton.button2:AppButton.button1,
                      onPressed:(){setState((){curState=1;});}
                  ),
                ),
                SizedBox(height:10),
                Container(
                  width:150,
                  height:42,
                  child: TextButton(
                      child:Text("推荐规划"),
                      style:curState==3?AppButton.button2:AppButton.button1,
                      onPressed:(){setState((){curState=3;});}
                  ),
                ),
              ]
          ),
        ),
        curState==1?Container(
          height:size.height-48,
          width:400,
          child:Selector<ShareDataPage,List<Itinerary>>(
            selector: (BuildContext context,ShareDataPage model)=>model.MyIti,
            builder:(BuildContext context,List<Itinerary> MyIti,Widget?child){
              return ListView(
                children:List.generate(MyIti.length,(index)=>
                  TextButton(
                    onPressed:(){
                      Provider.of<ShareDataPage>(context,listen:false).ChangecurIti(MyIti[index]);
                      setState(() {curState=2;});
                    },
                    child:ItiCard1(Iti: MyIti[index]),
                    style: AppButton.button2,
                  )
                )
              );
            }
          )
        ):Container(),
        curState==2?Container(
          height:size.height-48,
          width:550,
          color:AppColors1.primaryColor,
          child:Stack(
            children:[
              Selector<ShareDataPage,Itinerary>(
                selector:(BuildContext context,ShareDataPage model)=>model.curIti,
                builder:(BuildContext context,Itinerary curIti,Widget? child){
                  return Stack(
                    children:[
                      ItiEditWidget(curIti: curIti),
                      TextButton(
                        onPressed:(){setState(() {curState=1;});},
                        child:Icon(Icons.chevron_left),
                        style:AppButton.button1
                      )
                    ]
                  );
                }
              )
            ]
          )
        ):Container(),
        curState==3?Container(
          height:size.height-48,
          width:400,
          child:ItiFeature()
        ):Container(),
        Container(
          width:size.width-150-(curState==0?0:400),
          height:size.height-48,
          child:DemoMap()
        )
      ]
    );
  }
}
