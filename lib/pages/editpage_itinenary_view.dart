import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/widgets/map_view.dart';
import 'package:intellij_tourism_designer/models/data_model.dart';
import 'package:intellij_tourism_designer/widgets/detail_view.dart';
import 'package:intellij_tourism_designer/widgets/itinerary_edit.dart';
import 'package:intellij_tourism_designer/widgets/itinerary_feature.dart';
import 'package:intellij_tourism_designer/helpers/itinerary_builder.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:intellij_tourism_designer/constants/constants.dart';
//import 'package:intellij_tourism_designer/helpers/POI_builder.dart';

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
      SizedBox(
          width: size.width - AppSize.contentWidth1 - AppSize.toolBarWidth1,
          height: size.height - AppSize.buttonHeight1,
          child: const DemoMap())
    ]);
  }

  Widget buildSwitchButton(Size size) {
    return Container(
      height: size.height - AppSize.topBarHeight,
      width: AppSize.toolBarWidth1,
      color: AppColors1.primaryColor,
      child: Column(children: <Widget>[
        SizedBox(
          width: AppSize.toolBarWidth1,
          height: AppSize.buttonHeight2,
          child: TextButton(
              style: curState == ItineraryState.myItinerary
                  ? AppButton.button2
                  : AppButton.button1,
              child: const Text("我的规划"),
              onPressed: () {
                setState(() {
                  curState = ItineraryState.myItinerary;
                });
              }),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: AppSize.toolBarWidth1,
          height: AppSize.buttonHeight2,
          child: TextButton(
              style: curState == ItineraryState.recommendItinerary
                  ? AppButton.button2
                  : AppButton.button1,
              child: const Text("推荐规划"),
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
        return SizedBox(
          height: size.height - AppSize.buttonHeight1,
          width: AppSize.contentWidth1,
            child: Selector<ShareDataPage, List<Itinerary>>(
              selector: (BuildContext context, ShareDataPage model) =>
                model.myItis,
              builder: (BuildContext context, List<Itinerary> myItis, Widget? child) {
                return ListView(
                  children: List.generate(
                    myItis.length,
                    (index) => TextButton(
                      onPressed: () {
                        Provider.of<ShareDataPage>(context, listen: false)
                          .changeCurIti(myItis[index]);
                        setState(() {
                          curState = ItineraryState.editItinerary;
                        });
                      },
                      style: AppButton.button2,
                      child: ItiCard1(curIti: myItis[index]),
                      )));
              }));
      case ItineraryState.editItinerary:
        return SizedBox(
            height: size.height - AppSize.topBarHeight,
            width: AppSize.toolBarWidth1+AppSize.contentWidth1,
            child:Selector<ShareDataPage, Itinerary>(
              selector: (BuildContext context, ShareDataPage model) =>
                model.curIti,
              builder: (BuildContext context, Itinerary curIti, Widget? child) {
                return Stack(
                  children: [
                    ItiEditWidget(curIti: curIti),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          curState = ItineraryState.myItinerary;
                        });
                      },
                      style: AppButton.button1,
                      child: const Icon(Icons.chevron_left),
                    )
                  ]);
                }
              )
            );
      case ItineraryState.recommendItinerary:
        return SizedBox(
            height: size.height - AppSize.topBarHeight,
            width: AppSize.contentWidth1,
            child: const ItiFeature());
      default:
        return Container();
    }
  }
}
