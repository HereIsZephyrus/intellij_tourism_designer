import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:intellij_tourism_designer/widgets/ItemList.dart';

class PathQueryWidget extends StatefulWidget {
  const PathQueryWidget({super.key});

  @override
  State<PathQueryWidget> createState() => _PathQueryWidgetState();
}

class _PathQueryWidgetState extends State<PathQueryWidget> {
  List<POI> WayPoint=[POI(),POI()];
  int Transport=0;
  int Strategy=0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment(0,0),
          width:280,
          height:300,
          child: ReorderableListView(
            children: List.generate(WayPoint.length,(index)=>
              Container(
                key:ValueKey(index),
                width:280,
                height:120,
                padding:EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0,),
                child: TextButton(
                  onPressed:(){},
                  child:POICard3(poi:WayPoint[index]),
                  style:AppButton.button2
                ),
              )
            ),
            onReorder:(int oldIndex,int newIndex){
              setState((){
                if(oldIndex<newIndex){newIndex-=1;}
                final POI item =WayPoint.removeAt(oldIndex);
                WayPoint.insert(newIndex,item);
              });
            }
          )
        ),
        SizedBox(height:10),
        SizedBox(
          width:150,
          child: TextButton(
            onPressed:(){setState((){WayPoint.add(POI());});},
            child:Text("添加途径点"),
            style:AppButton.button1
          ),
        ),
        //Divider(height:20,thickness: 1,indent:20,endIndent:20,color:AppColors1.primaryColor),
        SizedBox(height:20),
        Container(
          height:70,
          color:AppColors1.primaryColor,
          child:Column(
            children: [
              Text("出行方式",style:AppText.bgStandard),
              Row(
                children:[
                  TextButton(
                    onPressed:(){setState(() {Transport=1;});},
                    child:(Text("步行")),
                    style:Transport==1 ? AppButton.button1 : AppButton.button2,
                  ),
                  TextButton(
                    onPressed:(){setState(() {Transport=2;});},
                    child:(Text("骑行")),
                    style:Transport==2 ? AppButton.button1 : AppButton.button2,
                  ),
                  TextButton(
                    onPressed:(){setState(() {Transport=3;});},
                    child:(Text("公交")),
                    style:Transport==3 ? AppButton.button1 : AppButton.button2,
                  ),
                  TextButton(
                    onPressed:(){setState(() {Transport=4;});},
                    child:(Text("地铁")),
                    style:Transport==4 ? AppButton.button1 : AppButton.button2,
                  ),
                  TextButton(
                    onPressed:(){setState(() {Transport=5;});},
                    child:(Text("驾车")),
                    style:Transport==5? AppButton.button1 : AppButton.button2,
                  )
                ]
              ),
            ],
          )
        ),
        SizedBox(height:20),
        Container(
          height:70,
          color:AppColors1.primaryColor,
          child:Column(
            children: [
              Text("策略",style:AppText.bgStandard),
              IndexedStack(
                index:Transport,
                children:[
                  Container(),
                  Row(
                    children:[
                      TextButton(
                        onPressed:(){setState(() {Strategy=1;});},
                        child:(Text("距离最短")),
                        style: Strategy==1? AppButton.button1 : AppButton.button2,
                      ),
    TextButton(
    onPressed:(){setState(() {Strategy=2;});},
    child:(Text("探索小路")),
    style: Strategy==2? AppButton.button1 : AppButton.button2,
    ),
    TextButton(
    onPressed:(){setState(() {Strategy=3;});},
    child:(Text("风景不错")),
    style: Strategy==3? AppButton.button1 : AppButton.button2,
    ),
                    ]
                  )
                ]
              ),
            ],
          )
        ),
        SizedBox(height:30),
        Text("热门地点",style:AppText.pStandard),
        Container(
          height:300,
          child:POIList1()
        )
      ],
    );
  }
}
