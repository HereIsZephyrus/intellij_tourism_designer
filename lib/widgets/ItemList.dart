import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/widgets/DetailView.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';

//设施列表样式1，或许后续有其他样式
class POIList1 extends StatefulWidget {
  const POIList1({super.key});

  @override
  State<POIList1> createState() => _POIList1State();
}

class _POIList1State extends State<POIList1> {
  final List<POI> dataList=List.generate(20, (index) => POI());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: POICard2(poi:dataList[index]),
          );
        },
    );
  }
}

//设施列表样式2，或许后续有其他样式
class POIList2 extends StatefulWidget {
  const POIList2({super.key});

  @override
  State<POIList2> createState() => _POIList2State();
}

class _POIList2State extends State<POIList2> {
  final List<POI> dataList=List.generate(20, (index) => POI());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: POICard3(poi:dataList[index]),
        );
      },
    );
  }
}




