import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_tencent_lbs_plugin_method_channel.dart';

abstract class FlutterTencentLBSPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterTencentLBSPluginPlatform.
  FlutterTencentLBSPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTencentLBSPluginPlatform _instance =
      MethodChannelFlutterTencentLBSPlugin();

  /// The default instance of [FlutterTencentLBSPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTencentLBSPlugin].
  static FlutterTencentLBSPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTencentLBSPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterTencentLBSPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
