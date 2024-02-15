import 'package:flutter_tencent_lbs_plugin/model/enum.dart';

import 'flutter_tencent_lbs_plugin_platform_interface.dart';
import 'model/android_notification_options.dart';
import 'model/location.dart';
import 'state/location_state.dart';

export 'model/android_notification_options.dart';
export 'model/notification_icon_data.dart';
export 'model/location.dart';
export 'model/status.dart';
export 'model/enum.dart';

class FlutterTencentLBSPlugin {
  Future<bool> init({
    /// 申请的 apiKey（仅对 iOS 生效，Android 需要在 AndroidManifest.xml 中设置）
    required String key,

    /// 经纬度坐标类型
    int coordinateType = TencentLBSLocationCoordinateType.GCJ02,

    /// 设置是否允许MockGPS
    bool mockEnable = false,

    /// 设置请求级别
    /// 根据用户获取的位置信息的详细程度，可以选择不同的 [TencentLBSRequestLevel] 使用
    int requestLevel = TencentLBSRequestLevel.AdminName,

    /// Android Only
    /// 定位模式
    int locMode = TencentLBSLocMode.HIGH_ACCURACY_MODE,

    /// Android Only
    /// 是否允许使用GPS
    /// 建议用户开启，在室外场景可以显著提升定位精度。
    bool isAllowGPS = true,

    /// Android Only
    /// 是否需要开启室内定位
    /// 一旦设置为true，内部将启动适配室内定位的策略。如果用户App定位场景室内较多时建议开启。可以提升室内定位准确率。
    bool isIndoorLocationMode = false,

    /// Android Only
    /// 设置GPS优先
    /// 设置Gps优先，一旦设置为true，首次定位将等待卫星定位结果，超时时间默认为5s，超时时间后仍无卫星定位结果将返回网络定位结果。
    /// 注：只有高精度定位模式下可以使用此设置
    bool isGpsFirst = false,

    /// Android Only
    /// 定义GPS超时时间，超过该时间仍然没有卫星定位结果将返回网络定位结果
    int gpsFirstTimeOut = 5000,
  }) async {
    return await FlutterTencentLBSPluginPlatform.instance.init(
      key: key,
      coordinateType: coordinateType,
      mockEnable: mockEnable,
      requestLevel: requestLevel,
      locMode: locMode,
      isAllowGPS: isAllowGPS,
      isIndoorLocationMode: isIndoorLocationMode,
      isGpsFirst: isGpsFirst,
      gpsFirstTimeOut: gpsFirstTimeOut,
    );
  }

  void setUserAgreePrivacy() {
    FlutterTencentLBSPluginPlatform.instance.setUserAgreePrivacy();
  }

  /// 单次定位
  Future<Location?> getLocationOnce() async {
    return await FlutterTencentLBSPluginPlatform.instance.getLocationOnce();
  }

  /// 连续定位
  Future<Location?> getLocation({
    required int interval,
    AndroidNotificationOptions? androidNotificationOptions,
    bool backgroundLocation = false,
  }) async {
    return await FlutterTencentLBSPluginPlatform.instance.getLocation(
      interval: interval,
      androidNotificationOptions: androidNotificationOptions,
      backgroundLocation: backgroundLocation,
    );
  }

  /// 状态回调（仅Android）
  void addStatusListener(LocationStatusListener listener) {
    FlutterTencentLBSPluginPlatform.instance.state.statusListener.add(listener);
  }

  /// 定位失败回调
  void addFailListener(LocationCallBack listener) {
    FlutterTencentLBSPluginPlatform.instance.state.failListener.add(listener);
  }

  /// 定位成功回调
  void addLocationListener(LocationCallBack listener) {
    FlutterTencentLBSPluginPlatform.instance.state.listener.add(listener);
  }

  void stop() {
    FlutterTencentLBSPluginPlatform.instance.stop();
  }
}
