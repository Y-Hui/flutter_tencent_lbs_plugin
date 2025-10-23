import 'dart:io';

class TencentLBSLocationCoordinateType {
  /// 火星坐标，即国测局坐标
  static int get GCJ02 {
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 0;
    }
    return 1;
  }

  /// 地球坐标，注：如果是海外，无论设置的是火星坐标还是地球坐标，返回的都是地球坐标
  static int get WGS84 {
    if (Platform.isAndroid) {
      return 0;
    } else if (Platform.isIOS) {
      return 1;
    }
    return 0;
  }
}

class TencentLBSRequestLevel {
  /// 包含经纬度
  /// latitude, longitude, altitude, accuracy
  static const Geo = 0;

  /// 包含经纬度, 位置名称, 位置地址
  /// latitude, longitude, altitude, accuracy, name, address
  static const Name = 1;

  /// 包含经纬度，位置所处的中国大陆行政区划
  /// latitude, longitude, altitude, accuracy, name, address, nation, province, city, district, town, village, street, streetNo
  static const AdminName = 3;

  /// 包含经纬度，位置所处的中国大陆行政区划及周边POI列表
  /// latitude, longitude, altitude, accuracy, nation, province, city, district, town, village, street, streetNo, poiList, 没有 name 和 address
  static const Poi = 4;
}

class TencentLBSLocMode {
  /// 高精度定位模式，将同时使用网络定位和卫星定位，优先返回精度高的定位
  static const HIGH_ACCURACY_MODE = 10;

  /// 仅网络定位模式，将不启动gps定位，只使用网络定位，可以减少耗电量，但定位精度有所降低
  static const ONLY_NETWORK_MODE = 11;

  /// 仅GPS定位模式，将只返回GPS定位结果，在室外可提升定位精度（约3~10米），GPS首次获取位置较慢且耗电较高（请求定位未获得GPS结果或GPS丢失后，如果超时时间内无GPS结果，则返回网络定位结果，超时时间为8s）
  static const ONLY_GPS_MODE = 12;
}
