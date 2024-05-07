import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/widgets/map_view.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';
import 'package:intellij_tourism_designer/widgets/itinerary_edit.dart';
import 'package:intellij_tourism_designer/widgets/itinerary_feature.dart';

//行程规划模块

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

enum ItineraryState {
  myItinerary,
  editItinerary,
  recommendItinerary,
}

class _ItineraryPageState extends State<ItineraryPage> {
  ItineraryState curState = ItineraryState.myItinerary;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget featureBlock = showFeatureBlock(curState, size);
    Widget featureSwitchButton = buildSwitchButton(size);
    return Row(children: [
      if (curState != ItineraryState.editItinerary) featureSwitchButton,
      featureBlock,
      Container(
          width: size.width - 150 - (curState == 0 ? 0 : 400),
          height: size.height - 48,
          child: DemoMap())
    ]);
  }

  Widget buildSwitchButton(Size size) {
    return Container(
      height: size.height - 48,
      width: 150,
      color: AppColors1.primaryColor,
      child: Column(children: <Widget>[
        Container(
          width: 150,
          height: 42,
          child: TextButton(
              child: Text("我的规划"),
              style: curState == ItineraryState.myItinerary
                  ? AppButton.button2
                  : AppButton.button1,
              onPressed: () {
                setState(() {
                  curState = ItineraryState.myItinerary;
                });
              }),
        ),
        SizedBox(height: 10),
        Container(
          width: 150,
          height: 42,
          child: TextButton(
              child: Text("推荐规划"),
              style: curState == ItineraryState.recommendItinerary
                  ? AppButton.button2
                  : AppButton.button1,
              onPressed: () {
                setState(() {
                  curState = ItineraryState.recommendItinerary;
                });
              }),
        ),
      ]),
    );
  }

  Widget showFeatureBlock(ItineraryState state, Size size) {
    switch (state) {
      case ItineraryState.myItinerary:
        return Container(
            height: size.height - 48,
            width: 400,
            child: Selector<ShareDataPage, List<Itinerary>>(
                selector: (BuildContext context, ShareDataPage model) =>
                    model.MyIti,
                builder: (BuildContext context, List<Itinerary> MyIti,
                    Widget? child) {
                  return ListView(
                      children: List.generate(
                          MyIti.length,
                          (index) => TextButton(
                                onPressed: () {
                                  Provider.of<ShareDataPage>(context,
                                          listen: false)
                                      .ChangecurIti(MyIti[index]);
                                  setState(() {
                                    curState = ItineraryState.editItinerary;
                                  });
                                },
                                child: ItiCard1(Iti: MyIti[index]),
                                style: AppButton.button2,
                              )));
                }));
      case ItineraryState.editItinerary:
        return Container(
            height: size.height - 48,
            width: 550,
            color: AppColors1.primaryColor,
            child: Stack(children: [
              Selector<ShareDataPage, Itinerary>(
                  selector: (BuildContext context, ShareDataPage model) =>
                      model.curIti,
                  builder:
                      (BuildContext context, Itinerary curIti, Widget? child) {
                    return Stack(children: [
                      ItiEditWidget(curIti: curIti),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              curState = ItineraryState.myItinerary;
                            });
                          },
                          child: Icon(Icons.chevron_left),
                          style: AppButton.button1)
                    ]);
                  })
            ]));
      case ItineraryState.recommendItinerary:
        return Container(
            height: size.height - 48, width: 400, child: ItiFeature());
      default:
        return Container();
    }
  }
}
