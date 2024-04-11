import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:intellij_tourism_designer/widgets/TileProviders.dart';
class DemoMap extends StatefulWidget {
  const DemoMap({super.key});
  @override
  State<DemoMap> createState() => _PraticeState();
}
class _PraticeState extends State<DemoMap> {
  late final MapController _mapController;
  final map = TileMap(Provider.osm);

  static const _markers = [
    Marker(
      width: 80,
      height: 80,
      point: Location.nanwangshan,
      child: Icon(Icons.school_sharp, color: Color.fromARGB(255, 54, 168, 244),size: 60,),
    ),
    Marker(
      width: 80,
      height: 80,
      point: Location.weilaicheng,
      child: Icon(Icons.school_sharp, color: Color.fromARGB(255, 244, 105, 54),size: 60,),
    ),
    Marker(
      width: 80,
      height: 80,
      point: Location.home,
      child: Icon(Icons.home, color: Color.fromARGB(255, 54, 244, 73),size: 60,),
    ), 
  ];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child:
        LayoutBuilder(builder:  (context, constraints) {
          return 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.nanwangshan, 15.7),
                        child: const Text('南望山校区'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.weilaicheng, 17),
                        child: const Text('未来城校区'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.home, 10),
                        child: const Text('我的家乡'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.wuhan, 7),
                        child: const Text('武汉市区公园绿地'),
                        ),
                    ] 
                  )
                ),
                
                Flexible(
                  fit: FlexFit.tight,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: Location.nanwangshan,
                      initialZoom: 17,
                      maxZoom: 19,
                      minZoom: 10,
                      cameraConstraint: CameraConstraint.contain(
                        bounds: LatLngBounds( // unlimit the map range 
                          const LatLng(-90, -180),
                          const LatLng(90,180),
                        ),
                      ),
                    ),
                    children: [
                      map.map,
                      const MarkerLayer(markers: _markers),
                      RichAttributionWidget(
                              popupInitialDisplayDuration: const Duration(seconds: 5),
                              animationConfig: const ScaleRAWA(),
                              showFlutterMapAttribution: false,
                              attributions: [
                                map.info,
                                const TextSourceAttribution(
                                  '这是一个使用Flutter web呈现地图服务的demo,用于tcb提交WebGIS作业.'
                                  '选择Flutter的原因是Flutter可以非常方便地做跨平台分发.'
                                  '因此该网页使用Dart脚本而非JavaScript脚本.',
                                  prependCopyright: false,
                                ),
                              ],
                            ),
                          ],    
                    ),
                  )
              ],
            );
        }
      )
    );
  }
}

/*
 
*/