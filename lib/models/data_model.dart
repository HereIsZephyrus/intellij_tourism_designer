import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/constants.dart';
import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
import 'package:intellij_tourism_designer/helpers/itinerary_builder.dart';

class ShareDataPage extends ChangeNotifier {
  POI curPOI=POI();
  bool detailed=false;
  List<Itinerary> myItis=[sampleIti,sampleIti,sampleIti];
  Itinerary curIti=sampleIti;
  List<POI> poiList=List.generate(20, (index) => POI());


  POI get getPOI => curPOI;
  bool get isDetailed => detailed;
  Itinerary get getIti => curIti;
  List<POI> get getPOIList =>poiList;

  void changePOI(POI newPOI) {
    curPOI=newPOI;
    notifyListeners(); // 通知依赖此状态的 Widget 重新构建
  }
  void changeDetailed(bool b){
    detailed=b;
    notifyListeners();
  }
  void changeCurIti(Itinerary newIti){
    curIti=newIti;
    notifyListeners();
  }
}
