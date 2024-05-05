import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intellij_tourism_designer/constants/constants.dart';
import 'package:intellij_tourism_designer/constants/locations.dart';
import 'package:latlong2/latlong.dart';
import 'package:intellij_tourism_designer/widgets/tile_providers.dart';
import 'package:intellij_tourism_designer/constants/markers.dart';
import 'package:intellij_tourism_designer/widgets/zoom_button.dart';
class DemoMap extends StatefulWidget {
  const DemoMap({super.key});
  @override
  State<DemoMap> createState() => _PraticeState();
}
class _PraticeState extends State<DemoMap> 
  with TickerProviderStateMixin{
  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';
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
  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final camera = _mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
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
                        //onPressed: () => _mapController.move(Location.nanwangshan, 15),
                        onPressed: () => _animatedMapMove(Location.nanwangshan, 15),
                        child: const Text('南望山校区'),
                        ),
                      MaterialButton(
                        //onPressed: () => _mapController.move(Location.weilaicheng, 15),
                        onPressed: () => _animatedMapMove(Location.weilaicheng, 15),
                        child: const Text('未来城校区'),
                        ),
                      MaterialButton(
                        //onPressed: () => _mapController.move(Location.home, 10),
                        onPressed: () => _animatedMapMove(Location.home, 10),
                        child: const Text('我的家乡'),
                        ),
                      MaterialButton(
                        //onPressed: () => _mapController.move(Location.wuhan, 7),
                        onPressed: () => _animatedMapMove(Location.wuhan, 7),
                        child: const Text('武汉市公园绿地'),
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
                      initialZoom: 16.5,
                      maxZoom: MAXZOOM,
                      minZoom: MINZOOM,
                      cameraConstraint: CameraConstraint.contain(
                        bounds: LatLngBounds( // unlimit the map range 
                          const LatLng(-90, -180),
                          const LatLng(90,180),
                        ),
                      ),
                    ),
                    children: [
                      map.map,
                      /*
                      OverlayImageLayer(
                        overlayImages: [
                          OverlayImage(
                            bounds: LatLngBounds(
                              const LatLng(30.03530016191824, 114.00827722384962),
                              const LatLng(30.900356706821714, 114.79334182886498),
                            ),
                            opacity: 0.8,
                            imageProvider: const NetworkImage("https://cdn.jsdelivr.net/gh/HereIsZephyrus/zephyrus.img/images/blog/WuhanParkShp.jpg"),
                          ),
                        ],
                      ),*/
                      MarkerLayer(markers: _markers),
                      const FlutterMapZoomButtons(
                        maxZoom: MAXZOOM,
                        minZoom: MINZOOM,
                        mini: true,
                        padding: 10,
                        alignment: Alignment.topLeft,
                      ),
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