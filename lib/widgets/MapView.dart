import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:intellij_tourism_designer/widgets/TileProviders.dart';
import 'package:intellij_tourism_designer/constants/Markers.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});
  @override
  State<MapWidget> createState() => _PraticeState();
}
class _PraticeState extends State<MapWidget> {
  late final MapController _mapController;
  TileMap map = TileMap(MapServiceProvider.osm); // The map here is a state.
  late var _markers = MarkerList.normalBookmark;

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
    return LayoutBuilder(builder:  (context, constraints) {
          return Stack(
            alignment: Alignment.topRight,
              children: [
                 FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: Location.wuhan,
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
                                map.info
                              ],
                            ),
                          ],    
                    ),
                      Column(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                _changeMapProviderProvider(MapServiceProvider.osm);
                                _changeBookmarkLevel(MarkerLevel.normal);
                              },
                              style:AppButton.button3,
                              child: const Text('OSM'),
                            ),
                            TextButton(
                              onPressed: () {
                                _changeMapProviderProvider(MapServiceProvider.tianditu);
                                _changeBookmarkLevel(MarkerLevel.normal);
                              },
                              style:AppButton.button3,
                              child: const Text('天地图'),
                            ),
                            TextButton(
                              onPressed: () {
                                _changeMapProviderProvider(MapServiceProvider.gaode);
                                _changeBookmarkLevel(MarkerLevel.none);
                              },
                              style:AppButton.button3,
                              child: const Text('高德'),
                            ),
                          ]
                      )
              ],
            );
        }
    );
  }
}

/*
 
*/