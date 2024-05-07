import 'package:latlong2/latlong.dart';
/*
* 存储POI坐标
*/
class Location {
  static const LatLng nanwangshan = LatLng(30.5236,114.3978);
  static const LatLng weilaicheng = LatLng(30.45996,114.61297);
  static const LatLng home = LatLng(29.88610,121.58349);
  static const LatLng wuhan = LatLng(30.5948,114.3011);
  static const Map<String,LatLng> weilaichengDetail = {
    'northDoor': LatLng(30.46259,114.61287),
    'westDoor': LatLng(30.46102,114.60550),
    'eastDoor': LatLng(30.46012,114.61728),
    'libary': LatLng(30.45903,114.61308),
    'dinningRoom': LatLng(30.45797,114.61318),
    'dormitory': LatLng(30.45800,114.61205),
    'schoolBuilding': LatLng(30.46228,114.61472),
  };
}