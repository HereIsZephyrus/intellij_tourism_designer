import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
//import 'package:intellij_tourism_designer/widgets/Drawer.dart';
class EditTracePage extends StatefulWidget {
  const EditTracePage({super.key});

  @override
  State<EditTracePage> createState() => _EditTracePageState();
}

enum ViewType{
    dataCheck,
    itineraryEdit,
    routeTrace,
}
class _EditTracePageState extends State<EditTracePage> {
  ViewType _selectedView=ViewType.dataCheck; // 记录当前选择的应用,默认为行程数据检查试图
  
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
                    style:_selectedView==ViewType.dataCheck?AppButton.button1:AppButton.button2,
                    child:const Icon(Icons.abc),
                    onPressed:(){
                      setState((){_selectedView=ViewType.dataCheck;});
                    }
                    
                  ),
                ),
                Container(
                  width:90,
                  height:48,
                  child: TextButton(
                    style:_selectedView==ViewType.itineraryEdit?AppButton.button1:AppButton.button2,
                    child:const Icon(Icons.access_alarm),
                    onPressed:(){
                      setState((){_selectedView=ViewType.itineraryEdit;});
                    }
                  ),
                ),
                Container(
                  width:90,
                  height:48,
                  child: TextButton(
                    style:_selectedView==ViewType.routeTrace?AppButton.button1:AppButton.button2,
                    child:const Icon(Icons.adb),
                    onPressed:(){
                      setState((){_selectedView=ViewType.routeTrace;});
                    }
                  ),
                )
              ]
            ),
            const Divider(
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
                index:_selectedView.index,
                children:<Widget>[
                ]
              ),
            )
          ]
      ),
    );
  }
}