import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
//import 'package:intellij_tourism_designer/constants/theme.dart';

//设施列表样式1，或许后续有其他样式
class POIList1 extends StatefulWidget {
  const POIList1({super.key});

  @override
  State<POIList1> createState() => _POIList1State();
}
//设施列表样式2，或许后续有其他样式
class POIList2 extends StatefulWidget {
  const POIList2({super.key});

  @override
  State<POIList2> createState() => _POIList2State();
}


class _POIList1State extends State<POIList1> {
  final List<POI> dataList=List.generate(20, (index) => POI());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: POICard(style:1,poi:dataList[index]),
          );
        },
    );
  }
}
class _POIList2State extends State<POIList2> {
  final List<POI> dataList=List.generate(20, (index) => POI());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: POICard(style:2,poi:dataList[index]),
        );
      },
    );
  }
}




