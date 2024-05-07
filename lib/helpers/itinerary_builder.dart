import 'package:intellij_tourism_designer/helpers/POI_builder.dart';

class Activity {
  POI point;
  DateTime start;
  Duration duration;

  Activity({required this.point, required this.start, required this.duration});
}

class Itinerary {
  String Name;

  List<POI> WayPoint;
  List<int> PathMode;
  List<String> ImageURL;

  List<List<Activity>> Activitices;
  List<Weather> weathers;

  Itinerary(
      {required this.Name,
      required this.WayPoint,
      required this.PathMode,
      required this.Activitices,
      required this.ImageURL,
      required this.weathers});
}

class Weather {
  DateTime time;
  String weather;

  Weather({required this.time, required this.weather});
}

class Comment {
  String UserName;
  String Content;
  DateTime time;
  List<String> imageURL;

  Comment(
      {required this.UserName,
      required this.Content,
      required this.time,
      required this.imageURL});
}