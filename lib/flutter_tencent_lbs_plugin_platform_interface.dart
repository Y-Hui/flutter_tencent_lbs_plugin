import 'package:flutter_tencent_lbs_plugin/state/location_state.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tencent_lbs_plugin_method_channel.dart';
import 'model/android_notification_options.dart';
import 'model/location.dart';

abstract class FlutterTencentLBSPluginPlatform extends PlatformInterface {
  FlutterTencentLBSPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTencentLBSPluginPlatform _instance =
      MethodChannelFlutterTencentLBSPlugin();

  static FlutterTencentLBSPluginPlatform get instance => _instance;

  static set instance(FlutterTencentLBSPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  LocationState state = LocationState();

  Future<bool> init({
    required String key,
    int? coordinateType,
    bool? mockEnable,
    int? requestLevel,
    int? locMode,
    bool? isAllowGPS,
    bool? isIndoorLocationMode,
    bool? isGpsFirst,
    int? gpsFirstTimeOut,
  }) {
    throw UnimplementedError('init() has not been implemented.');
  }

  void stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }

  void setUserAgreePrivacy() {
    throw UnimplementedError('setUserAgreePrivacy() has not been implemented.');
  }

  Future<Location?> getLocation({
    required int interval,
    AndroidNotificationOptions? androidNotificationOptions,
    bool backgroundLocation = false,
  }) {
    throw UnimplementedError('getLocation() has not been implemented.');
  }

  Future<dynamic> getLocationOnce() {
    throw UnimplementedError('getLocationOnce() has not been implemented.');
  }
}
