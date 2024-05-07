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


class POIcard{
  final POI info;
  const POIcard(POI poi):
    info=poi;

  @override
  String toString() {
    return 'POIcard{info: $info}';
  }
}
