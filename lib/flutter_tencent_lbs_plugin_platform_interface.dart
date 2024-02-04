import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tencent_lbs_plugin_method_channel.dart';

abstract class FlutterTencentLbsPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterTencentLbsPluginPlatform.
  FlutterTencentLbsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTencentLbsPluginPlatform _instance = MethodChannelFlutterTencentLbsPlugin();

  /// The default instance of [FlutterTencentLbsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTencentLbsPlugin].
  static FlutterTencentLbsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTencentLbsPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterTencentLbsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
