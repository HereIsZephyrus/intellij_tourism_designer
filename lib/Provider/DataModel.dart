import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/location.dart';

class ShareDataPage extends ChangeNotifier {
  POI curPOI=POI();
  bool detailed=false;
  List<Itinerary> MyIti=[SampleIti,SampleIti,SampleIti];
  Itinerary curIti=SampleIti;


  POI get getPOI => curPOI;
  bool get isDetailed => detailed;
  Itinerary get getIti => curIti;


  void ChangePOI(POI newPOI) {
    curPOI=newPOI;
    notifyListeners(); // 通知依赖此状态的 Widget 重新构建
  }
  void ChangeDetailed(bool b){
    detailed=b;
    notifyListeners();
  }
  void ChangecurIti(Itinerary newIti){
    curIti=newIti;
    notifyListeners();
  }
}
