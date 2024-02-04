import 'flutter_tencent_lbs_plugin_platform_interface.dart';

class FlutterTencentLBSPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterTencentLBSPluginPlatform.instance.getPlatformVersion();
  }
}
