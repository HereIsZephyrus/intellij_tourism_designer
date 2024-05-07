import 'package:flutter/material.dart';
/*
* 行程编辑界面的侧边栏绘制
*/
class MenuDrawer extends StatelessWidget{
  final String currentRoute;
  
  const MenuDrawer(this.currentRoute,{super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [],
            )
          )
        ],
      ),
    );
  }
}