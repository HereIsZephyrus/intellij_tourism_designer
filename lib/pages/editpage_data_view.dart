import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/constants/items.dart';
import 'package:intellij_tourism_designer/widgets/map_view.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/widgets/city_stats.dart';
import 'package:intellij_tourism_designer/widgets/path_query.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';

//信息查看模块
enum FeatureState {
  thematicMaps,
  infrestructureCheck,
  pathQuery,
  cityStats,
}

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<bool> MapLayer = List.generate(7, (index) => false);
  POI curPOI = POI();
  FeatureState curState = FeatureState.thematicMaps;

  List<Widget> featureButtonBar() {
    return [
      featureButton(FeatureState.thematicMaps, "专题地图"),
      featureButton(FeatureState.infrestructureCheck, "设施查看"),
      featureButton(FeatureState.pathQuery, "路径查询"),
      featureButton(FeatureState.cityStats, "武汉文旅"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget featureBlock = showFeatureBlock(curState, size);
    return Row(children: <Widget>[
      Container(
        height: size.height - 48,
        width: 150,
        color: AppColors1.primaryColor,
        child: Column(
          children: featureButtonBar(),
        ),
      ),
      featureBlock,
    ]);
  }

  Widget featureButton(FeatureState state, String name) {
    return Container(
      width: 150,
      height: 42,
      child: TextButton(
          style: curState == state ? AppButton.button2 : AppButton.button1,
          child: Text(name),
          onPressed: () {
            setState(() {
              curState = state;
            });
          }),
    );
  }

  Widget showFeatureBlock(FeatureState curState, Size size) {
    switch (curState) {
      case FeatureState.thematicMaps:
        return Container(
            height: size.height - 48,
            width: 180,
            child: Column(
                children: List.generate(
              7,
              (index) => Row(
                children: [
                  Checkbox(
                      value: MapLayer[index],
                      onChanged: (bool? newValue) {
                        setState(() {
                          MapLayer[index] = newValue ?? false;
                        });
                      }),
                  Text("Map${index}", style: AppText.Small)
                ],
              ),
            )));
      case FeatureState.infrestructureCheck:
        return Container(
            height: size.height - 48,
            width: 520,
            child: Selector<ShareDataPage, bool>(
                selector: (BuildContext context, ShareDataPage model) =>
                    model.detailed,
                builder: (BuildContext context, bool detailed, Widget? child) {
                  if (!detailed) {
                    return POIList1();
                  }
                  return Selector<ShareDataPage, POI>(
                      selector: (BuildContext context, ShareDataPage model) =>
                          model.curPOI,
                      builder:
                          (BuildContext context, POI curPOI, Widget? child) {
                        return Stack(children: [
                          POICard1(poi: curPOI),
                          TextButton(
                              onPressed: () {
                                Provider.of<ShareDataPage>(context,
                                        listen: false)
                                    .ChangeDetailed(false);
                              },
                              child: Icon(Icons.chevron_left),
                              style: AppButton.button1)
                        ]);
                      });
                }));
      case FeatureState.pathQuery:
        return Container(
            height: size.height - 48, width: 320, child: PathQueryWidget());
      case FeatureState.cityStats:
        return Container(
          width: size.width -
              150 -
              (curState == FeatureState.thematicMaps ? 180 : 0) -
              (curState == FeatureState.infrestructureCheck ? 520 : 0) -
              (curState == FeatureState.pathQuery ? 320 : 0),
          height: size.height - 48,
          child: CityStatsPage(),
        );
      default:
        return Container(
          width: size.width -
              150 -
              (curState == FeatureState.thematicMaps ? 180 : 0) -
              (curState == FeatureState.infrestructureCheck ? 520 : 0) -
              (curState == FeatureState.pathQuery ? 320 : 0),
          height: size.height - 48,
          child: const DemoMap(),
        );
    }
  }
}
