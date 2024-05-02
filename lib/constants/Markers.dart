import 'package:flutter_map/flutter_map.dart';
import 'package:intellij_tourism_designer/constants/locations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MarkerElement{
  static const Marker nanwangshan = Marker(
    width: 80,
    height: 80,
    point: Location.nanwangshan,
    child: Icon(Icons.school_sharp, color: Color.fromARGB(255, 54, 168, 244),size: 60,),
  );
  static const Marker weilaicheng = Marker(
    width: 80,
    height: 80,
    point: Location.weilaicheng,
    child: Icon(Icons.school_sharp, color: Color.fromARGB(255, 244, 105, 54),size: 60,),
  );
  static const Marker home = Marker(
    width: 80,
    height: 80,
    point: Location.home,
    child: Icon(Icons.home, color: Color.fromARGB(255, 54, 244, 73),size: 60,),
  );
  static var weilaichengDetail = _getWeilaichengDetail();
  static Map<String, Marker> _getWeilaichengDetail(){
    var dict = Map<String, Marker>();
    Location.weilaichengDetail.forEach((key, value) {
      dict[key] = Marker(
        width: 40,
        height: 40,
        point: value,
        child: const Icon(Icons.school_rounded,color: Color.fromARGB(255, 27, 6, 77),size: 30,), 
      );
    });
    return dict;
  }
}

enum MarkerLevel{
    normal,
    none,
    detailed,
  }
class MarkerList{
  static List<Marker> normalBookmark = [
    MarkerElement.nanwangshan,
    MarkerElement.weilaicheng,
    MarkerElement.home
  ];

  static List<Marker> noneBookmark = [];

  static List<Marker> weilaichengBookmark = [
    MarkerElement.nanwangshan,
    MarkerElement.weilaicheng,
    MarkerElement.home,
    ...MarkerElement.weilaichengDetail.values
  ];
}