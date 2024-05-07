class POI {
  double Lat, Lng;
  String Name;
  String Type;
  int Area;
  String info;
  String Location;
  String ImageURL;

  POI(
      {this.Lat = 0,
      this.Lng = 0,
      this.Name = "？未知地点",
      this.Type = "NONE",
      this.Area = -1,
      this.info = "暂无介绍，请！勇！敢！探！索！",
      this.Location = "....?",
      this.ImageURL = "assets/Sample.png"});
}

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

Activity SampleAct =
    Activity(point: POI(), start: DateTime(2000), duration: Duration());
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
