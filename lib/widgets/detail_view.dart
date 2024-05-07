import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';

//细节信息的展示卡片

class POICard1 extends StatefulWidget {
  final POI poi;

  const POICard1({
    Key? key,
    required this.poi
  }) : super(key: key);

  @override
  State<POICard1> createState() => _POICard1State(poi:poi);
}

class _POICard1State extends State<POICard1> {
  List<Comment> myCom=[SampleCon,SampleCon,SampleCon,SampleCon];
  POI poi;

  _POICard1State({required this.poi});

  @override
  Widget build(BuildContext context) {
    return Column(
        children:<Widget>[
          SizedBox(height:1),
          Image(image: AssetImage(poi.ImageURL)),
          Container(
            height:400,
            child: ListView(
              children:<Widget>[
                Row(
                  children:<Widget>[
                    Icon(Icons.ice_skating),
                    Text(poi.Name)
                  ]
                ),
                //Text(_facility["info"]),
                Text("评分"),
                Text(""),
                Divider(color:AppColors1.primaryColor, height:50, thickness:3, indent:30, endIndent:30),
                TextButton(
                  onPressed:(){setState(() {myCom.add(SampleCon);});},
                  child:Icon(Icons.add),
                  style:AppButton.button2
                ),
                Container(
                  height:300,
                  child:ListView(
                    children:List.generate(myCom.length,(index)=>
                      Column(
                        children:[
                          Text(myCom[index].UserName,style:AppText.Standard),
                          Text(myCom[index].Content,style:AppText.Standard)
                        ]
                      )
                    )
                  )
                )
              ]
            ),
          )
        ]
    );
  }
}






class POICard2 extends StatefulWidget {
  final POI poi;

  const POICard2({
    Key? key,
    required this.poi
  }) : super(key: key);

  @override
  State<POICard2> createState() => _POICard2State(poi:poi);
}

class _POICard2State extends State<POICard2> {
  POI poi;

  _POICard2State({required this.poi});

  @override
  Widget build(BuildContext context) {
    return  Flexible(
        fit: FlexFit.tight,
        child:Row(
            children:<Widget>[
              Flexible(
                flex:5,
                child: Column(
                  children:<Widget>[
                    Row(
                        children:<Widget>[
                          Icon(Icons.ice_skating),
                          Text(poi.Name),
                          TextButton(
                            onPressed:(){
                              Provider.of<ShareDataPage>(context, listen: false).ChangePOI(this.poi);
                              Provider.of<ShareDataPage>(context, listen: false).ChangeDetailed(true);
                            },
                            child:Icon(Icons.add),
                            style:AppButton.button1
                          )
                        ]
                    ),
                    Text(poi.info),
                    Text(poi.Location)
                    //......
                  ]
                ),
              ),
              Flexible(
                flex:4,
                child: Image(image: AssetImage(poi.ImageURL)),
              )
            ]
        )
    );
  }
}





class POICard3 extends StatefulWidget {
  final POI poi;

  const POICard3({
    Key? key,
    required this.poi
  }) : super(key: key);

  @override
  State<POICard3> createState() => _POICard3State(poi:poi);
}

class _POICard3State extends State<POICard3> {
  POI poi;

  _POICard3State({required this.poi});

  @override
  Widget build(BuildContext context) {
    return Row(
            children:<Widget>[
              Flexible(
                flex:3,
                child: Column(
                    children:<Widget>[
                      Row(
                          children:<Widget>[
                            Icon(Icons.ice_skating),
                            Text(poi.Name)
                          ]
                      ),
                      Text(poi.info)
                    ]
                ),
              ),
              Flexible(
                flex:2,
                child: Image(image: AssetImage(poi.ImageURL))
              ),
            ]
    );
  }
}

class ItiCard1 extends StatelessWidget {
  final Itinerary Iti;
  const ItiCard1({required this.Iti,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Flexible(
          flex:3,
          child: Column(
            children:[
              Text(Iti.Name,style:AppText.Small),
              Text("时间",style:AppText.Small),
            ]
          ),
        ),
        Flexible(
        flex:2,
        child: Image(image: AssetImage(Iti.ImageURL[0]))
        )
      ]
    );
  }
}

class ActCard1 extends StatelessWidget {
  final Activity curAct;
  const ActCard1({required this.curAct,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Flexible(
          flex:3,
          child:Column(
            children:[
              Row(
                children:[
                  Icon(Icons.abc),
                  Text(curAct.point.Name,style:AppText.Small),
                ]
              ),
              Text("时间：",style:AppText.Small)
            ]
          )
        ),
        Flexible(
          flex:2,
          child:Image(image: AssetImage(curAct.point.ImageURL))
        ),
      ]
    );
  }
}



class WeatherCard1 extends StatelessWidget {
  final Weather curWea;
  const WeatherCard1({required this.curWea,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Flexible(
          flex:5,
          child:Column(
            children: [
              Text('时间：????-??-??',style:AppText.Small),
              Card(
                child:Text("天气：         温度：           ",style:AppText.pStandard),
                surfaceTintColor:AppColors1.primaryColor
              )
            ]
          )
        ),
        Flexible(
          flex:3,
          child:Icon(Icons.sunny,size:50)
        )
      ]
    );
  }
}
