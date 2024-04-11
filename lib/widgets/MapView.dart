import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:intellij_tourism_designer/widgets/TileProviders.dart';
import 'package:intellij_tourism_designer/constants/Markers.dart';
class DemoMap extends StatefulWidget {
  const DemoMap({super.key});
  @override
  State<DemoMap> createState() => _PraticeState();
}
class _PraticeState extends State<DemoMap> {
  late final MapController _mapController;
  TileMap map = TileMap(MapServiceProvider.osm); // The map here is a state.
  late var _markers = MarkerList.normalBookmark;
  
  bool _isDetail = false;
  void _changeMapProviderProvider(MapServiceProvider provider) {
    setState(() {
      map = TileMap(provider);
    });
  }
  void _changeBookmarkLevel(MarkerLevel level) {
    setState(() {
      switch (level) {
        case MarkerLevel.normal:
          _markers = MarkerList.normalBookmark;
          break;
        case MarkerLevel.none:
          _markers = MarkerList.noneBookmark;
          break;
        case MarkerLevel.detailed:
          _markers = MarkerList.weilaichengBookmark;
          break;
      }
    });
  }

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
                        onPressed: () {
                          setState(() {
                            if (_isDetail) {
                              _changeBookmarkLevel(MarkerLevel.normal);
                            }
                            else{
                              _changeBookmarkLevel(MarkerLevel.detailed);
                            }
                            _isDetail = !_isDetail;
                          });
                        },
                        child: _isDetail? const Text('隐藏未来城校园信息') : const Text('显示未来城校园信息'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.nanwangshan, 15),
                        child: const Text('南望山校区'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.weilaicheng, 15),
                        child: const Text('未来城校区'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.home, 10),
                        child: const Text('我的家乡'),
                        ),
                      MaterialButton(
                        onPressed: () => _mapController.move(Location.wuhan, 7),
                        child: const Text('武汉市'),
                        ),
                    ] 
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () { 
                          _changeMapProviderProvider(MapServiceProvider.osm);
                          _changeBookmarkLevel(MarkerLevel.normal);
                        },
                        child: const Text('OpenStreetMap'),
                        ),
                      MaterialButton(
                        onPressed: () { 
                          _changeMapProviderProvider(MapServiceProvider.tianditu);
                          _changeBookmarkLevel(MarkerLevel.normal);
                        },
                        child: const Text('天地图'),
                        ),
                      MaterialButton(
                        onPressed: () { 
                          _changeMapProviderProvider(MapServiceProvider.gaode);
                          _changeBookmarkLevel(MarkerLevel.none);
                        },
                        child: const Text('高德地图'),
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
                      MarkerLayer(markers: _markers),
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