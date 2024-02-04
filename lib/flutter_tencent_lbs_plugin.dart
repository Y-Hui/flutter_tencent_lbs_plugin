
import 'flutter_tencent_lbs_plugin_platform_interface.dart';

class FlutterTencentLbsPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterTencentLbsPluginPlatform.instance.getPlatformVersion();
  }
}
