import 'dart:io';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
/**
 * 用于将GeoJSON格式文件的解析和图层制作
 */
Logger logger = Logger();
enum GeoJsonType{
  points,
  polylines,
  polygons,
  features,
}
class GeoJsonFeature{
  GeoJsonType type = GeoJsonType.features;
  GeoJsonParser parser;
  GeoJsonFeature(GeoJsonType featureType,Color faceColor,Color borderColor):
    parser = GeoJsonParser(
      defaultMarkerColor: faceColor,
      defaultPolygonBorderColor: borderColor,
      defaultPolygonFillColor: faceColor,
      defaultCircleMarkerColor: faceColor,
    ),//创建解析器,定义了要素显示的格式
    type = featureType;
  List<Widget> mapFeature(geoJsonString){
    parser.parseGeoJsonAsString(geoJsonString);
    
    switch(type){
      case GeoJsonType.points:
        return [MarkerLayer(markers: _getPoint())];
      case GeoJsonType.polylines:
        return [PolylineLayer(polylines: _getPolyline())];
      case GeoJsonType.polygons:
        return [PolygonLayer(polygons: _getPolygon())];
      case GeoJsonType.features:
        return [PolygonLayer(polygons: _getPolygon()),PolylineLayer(polylines: _getPolyline()),MarkerLayer(markers: _getPoint())];
      default:
        return [MarkerLayer(markers: _getPoint())];
    }
  }
  List<Marker> _getPoint(){logger.e("generate points");return parser.markers;}
  List<Polyline> _getPolyline(){logger.e("generate polylines");return parser.polylines;}
  List<Polygon> _getPolygon(){logger.e("generate polygons");return parser.polygons;} 
}
//创建各类要素生成器
GeoJsonFeature get pointsGeoJSON => GeoJsonFeature(GeoJsonType.points,Colors.brown,Colors.black);
GeoJsonFeature get polylinesGeoJSON => GeoJsonFeature(GeoJsonType.polylines,Colors.brown,Colors.black);
GeoJsonFeature get polygonsGeoJSON => GeoJsonFeature(GeoJsonType.polygons,Colors.orange,Colors.blueGrey);