import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum Provider {
  osm,
  google,
  baidu,
  mapbox,
  tianditu,
  gaode,
}

class TileMap{
  final Provider provider;
  final TileLayer map;
  final TextSourceAttribution info;

  TileMap(Provider provider):
    this.provider = provider,
    this.map = _tileMap(provider),
    this.info = _tileInfo(provider);
}

TextSourceAttribution _tileInfo(Provider provider){
  TextSourceAttribution info;
  switch (provider){
    case Provider.osm:
      info = TextSourceAttribution(
        '使用OpenStreetMap服务',
        onTap: () async => launchUrl(Uri.parse('https://openstreetmap.org/copyright'),),
      );
      break;
    case Provider.google:
      info = TextSourceAttribution(
        '使用Google服务',
        onTap: () async => launchUrl(Uri.parse('https://www.google.com/intl/zh-CN_us/help/terms_maps/')),
      );
      break;
    case Provider.baidu:
      info = TextSourceAttribution(
        '使用百度服务',
        onTap: () async => launchUrl(Uri.parse('https://map.baidu.com/')),
      );
      break;
    case Provider.mapbox:
      info = TextSourceAttribution(
        '使用Mapbox服务',
        onTap: () async => launchUrl(Uri.parse('https://www.mapbox.com/')),
      );
      break;
    case Provider.tianditu:
      info = TextSourceAttribution(
        '使用天地图服务',
        onTap: () async => launchUrl(Uri.parse('https://www.tianditu.com/')),
      );
      break;
    case Provider.gaode:
      info = TextSourceAttribution(
        '使用高德服务',
        onTap: () async => launchUrl(Uri.parse('https://www.amap.com/')),
      );
      break;
  }
  return info;
}

TileLayer _tileMap(Provider provider) {
    //assert(provider != null, 'provider must not be null');
    TileLayer tileLayer;

    switch (provider) {
      case Provider.osm:
        tileLayer = openStreetMapTileLayer;
        break;
      case Provider.google:
        tileLayer = googleTileLayer;
        break;
      case Provider.baidu:
        tileLayer = baiduTileLayer;
        break;
      case Provider.mapbox:
        tileLayer = mapboxTileLayer;
        break;
      case Provider.tianditu:
        tileLayer = tiandituTileLayer;
        break;
      case Provider.gaode:
        tileLayer = gaodeTileLayer;
        break;
      default:
        throw AssertionError(
            'Unsupported TileProvider $provider.');
    }
    return tileLayer;
  }

//TextSourceAttribution 
TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'intellij_tourism_designer',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );

TileLayer get googleTileLayer => TileLayer(
      urlTemplate: 'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
      userAgentPackageName: 'intellij_tourism_designer',
      tileProvider: CancellableNetworkTileProvider(),
    );

TileLayer get baiduTileLayer => TileLayer(
      urlTemplate: 'https://api.map.baidu.com/customimage/tile?x={x}&y={y}&z={z}',
      userAgentPackageName: 'intellij_tourism_designer',
      tileProvider: CancellableNetworkTileProvider(),
    );

TileLayer get mapboxTileLayer => TileLayer(
      urlTemplate: 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
      userAgentPackageName: 'intellij_tourism_designer',
      tileProvider: CancellableNetworkTileProvider(),
    );
  
TileLayer get tiandituTileLayer => TileLayer(
      urlTemplate: 'https://t0.tianditu.gov.cn/DataServer?T=vec_w&x={x}&y={y}&l={z}&tk=',
      userAgentPackageName: 'intellij_tourism_designer',
      tileProvider: CancellableNetworkTileProvider(),
    );

TileLayer get gaodeTileLayer => TileLayer(
      urlTemplate: 'https://webrd02.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
      userAgentPackageName: 'intellij_tourism_designer',
      tileProvider: CancellableNetworkTileProvider(),
    );