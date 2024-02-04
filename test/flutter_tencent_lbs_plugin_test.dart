import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin_platform_interface.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTencentLbsPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterTencentLbsPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterTencentLbsPluginPlatform initialPlatform = FlutterTencentLbsPluginPlatform.instance;

  test('$MethodChannelFlutterTencentLbsPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTencentLbsPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterTencentLbsPlugin flutterTencentLbsPlugin = FlutterTencentLbsPlugin();
    MockFlutterTencentLbsPluginPlatform fakePlatform = MockFlutterTencentLbsPluginPlatform();
    FlutterTencentLbsPluginPlatform.instance = fakePlatform;

    expect(await flutterTencentLbsPlugin.getPlatformVersion(), '42');
  });
}
