import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/widgets/PathQuery.dart';
import 'package:intellij_tourism_designer/widgets/MapView.dart';
import 'package:intellij_tourism_designer/widgets/ItemList.dart';
import 'package:intellij_tourism_designer/Provider/DataModel.dart';
import 'package:intellij_tourism_designer/widgets/CityStats.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<bool> MapLayer=List.generate(7, (index) => false);
  POI CurPOI=POI();
  int curState=0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children:<Widget>[
        Container(
              height:size.height-48,
              width:150,
              color:AppColors1.primaryColor,
              child: Column(
                children:<Widget>[
                  Container(
                    width:150,
                    height:42,
                    child: TextButton(
                        child:Text("专题地图"),
                        style:curState==1?AppButton.button2:AppButton.button1,
                        onPressed:(){
                          setState((){curState=1;});
                        }
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                    width:150,
                    height:42,
                    child: TextButton(
                        child:Text("设施查看"),
                        style:curState==2?AppButton.button2:AppButton.button1,
                        onPressed:(){
                          setState((){curState=2;});
                        }
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                    width:150,
                    height:42,
                    child: TextButton(
                        child:Text("路径查询"),
                        style:curState==3?AppButton.button2:AppButton.button1,
                        onPressed:(){
                          setState((){curState=3;});
                        }
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                    width:150,
                    height:42,
                    child: TextButton(
                        child:Text("武汉文旅"),
                        style:curState==4?AppButton.button2:AppButton.button1,
                        onPressed:(){
                          setState((){curState=4;});
                        }
                    ),
                  ),
                ]
              ),
            ),
        curState==1?Container(
              height:size.height-48,
              width:180,
              child:Column(
                children:List.generate(7, (index) =>
                  Row(
                    children: [
                      Checkbox(
                        value: MapLayer[index],
                        onChanged:(bool? newValue){
                          setState((){MapLayer[index]=newValue??false;});
                        }
                      ),
                      Text("Map${index}",style:AppText.Small)
                    ],
                  ),
                )
              )
            ):Container(),
        curState==2?Container(
              height:size.height-48,
              width:520,
              child:Selector<ShareDataPage,bool>(
                selector:(BuildContext context,ShareDataPage model)=>model.detailed,
                builder:(BuildContext context,bool detailed,Widget? child){
                  if(!detailed){return POIList1();}
                  return Selector<ShareDataPage,POI>(
                    selector:(BuildContext context,ShareDataPage model)=>model.curPOI,
                    builder:(BuildContext context,POI CurPOI,Widget? child){
                      return Stack(
                        children: [
                          POICard1(poi:CurPOI),
                          TextButton(
                            onPressed:(){Provider.of<ShareDataPage>(context, listen: false).ChangeDetailed(false);},
                            child:Icon(Icons.chevron_left),
                            style:AppButton.button1
                          )
                        ]
                      );
                    }
                  );
                }
              )
            ):Container(),
        curState==3?Container(
          height:size.height-48,
          width:320,
          child:PathQueryWidget()
        ):Container(),
        Container(
          width:size.width-150-(curState==1?180:0)-(curState==2?520:0)-(curState==3?320:0),
          height:size.height-48,
          child:curState==4?CityStatsPage():MapWidget()
        )
      ]
    );
  }
}
