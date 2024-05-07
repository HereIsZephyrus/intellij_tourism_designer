import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/widgets/map_view.dart';
import 'package:intellij_tourism_designer/pages/editpage_data_view.dart';
import 'package:intellij_tourism_designer/pages/editpage_itinenary_view.dart';
import 'package:intellij_tourism_designer/pages/editpage_companion_view.dart';

enum ViewType {
  dataCheck,
  itineraryEdit,
  routeTrace,
}
//import 'package:intellij_tourism_designer/widgets/Drawer.dart';
class EditTracePage extends StatefulWidget {
  const EditTracePage({super.key});

  @override
  State<EditTracePage> createState() => _EditTracePageState();
}

class _EditTracePageState extends State<EditTracePage> {
  ViewType _selectedView = ViewType.dataCheck; // 记录当前选择的应用,默认为行程数据检查试图

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: <Widget>[
        Row(children: guideButtonBar()),
        const Divider(
            thickness: 2,
            height: 0.0,
            indent: 0.0,
            endIndent: 0.0,
            color: AppColors1.primaryColor),
        Container(
          width: 1440,
          height: size.height - 48,
          child: IndexedStack(
            index: _selectedView.index, 
            children: const <Widget>[
              DataPage(),
              ItineraryPage(),
              CompanionPage(),
              DemoMap()
            ]
          ),
        )
      ]),
    );
  }

  List<Widget> guideButtonBar() {
    return <Widget>[
      guideButton(ViewType.dataCheck, const Icon(Icons.abc)),
      guideButton(ViewType.itineraryEdit, const Icon(Icons.access_alarm)),
      guideButton(ViewType.routeTrace, const Icon(Icons.adb)),
    ];
  }

  Widget guideButton(ViewType type,Icon icon) {
    return Container(
      width: 90,
      height: 48,
      child: TextButton(
          style: _selectedView == type
              ? AppButton.button1
              : AppButton.button2,
          child: icon,
          onPressed: () {
            setState(() {
              _selectedView = type;
            });
          }),
    );
  }
}
