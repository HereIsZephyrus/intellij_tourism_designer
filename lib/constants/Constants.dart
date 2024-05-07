import 'package:intellij_tourism_designer/helpers/POI_builder.dart';
import 'package:intellij_tourism_designer/helpers/itinerary_builder.dart';
// ignore_for_file: constant_identifier_names: 关闭对这个文件的代码风格检查
const double MINZOOM = 5.0;
const double MAXZOOM = 18.0;


Activity SampleAct =
    Activity(point: POI(), start: DateTime(2000), duration: const Duration());
Itinerary SampleIti = Itinerary(Name: "新建行程", WayPoint: [
  POI(),
  POI(),
  POI(),
  POI(),
  POI()
], PathMode: [
  0,
  0,
  0,
  0
], Activitices: [
  [SampleAct, SampleAct, SampleAct],
  [SampleAct, SampleAct, SampleAct],
  [SampleAct, SampleAct, SampleAct]
], ImageURL: [
  "assets/Sample.png",
  "assets/Sample.png",
  "assets/Sample.png"
], weathers: [
  SampleWeather,
  SampleWeather,
  SampleWeather
]);
Weather SampleWeather = Weather(time: DateTime(2000), weather: "Sunny");
Comment SampleCon = Comment(
    UserName: "User",
    Content: "好啊好啊",
    time: DateTime(2000),
    imageURL: ["assets/Sample.png", "assets/Sample.png", "assets/Sample.png"]);
