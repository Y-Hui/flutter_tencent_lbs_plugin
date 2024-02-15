// ignore_for_file: constant_identifier_names

class CellStatus {
  /// 模块关闭
  static const int STATUS_DISABLED = 0;

  /// 模块开启
  static const int STATUS_ENABLED = 1;

  /// 定位权限被禁止，位置权限被拒绝通常发生在禁用当前应用的 ACCESS_COARSE_LOCATION 等定位权限
  static const int STATUS_DENIED = 2;
}

class WiFiStatus {
  /// Wi-Fi开关关闭
  static const int STATUS_DISABLED = 0;

  /// Wi-Fi开关打开
  static const int STATUS_ENABLED = 1;

  /// 权限被禁止，禁用当前应用的 ACCESS_COARSE_LOCATION 等定位权限
  static const int STATUS_DENIED = 2;

  /// 位置信息开关关闭，在android M系统中，此时禁止进行Wi-Fi扫描
  static const int STATUS_LOCATION_SWITCH_OFF = 5;
}

class GPSStatus {
  /// GPS开关关闭
  static const int STATUS_DISABLED = 0;

  /// GPS开关打开
  static const int STATUS_ENABLED = 1;

  /// GPS可用，代表GPS开关打开，且搜星定位成功
  static const int STATUS_GPS_AVAILABLE = 3;

  /// GPS不可用，不可用有多种可能，比如：
  /// GPS开关被关闭，GPS开关开着但是没办法搜星或者在室内等定位不成功的情况
  static const int STATUS_GPS_UNAVAILABLE = 4;
}

class LocationStatus {
  final String name;
  final int status;

  const LocationStatus({
    required this.name,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "status": status,
    };
  }
}
