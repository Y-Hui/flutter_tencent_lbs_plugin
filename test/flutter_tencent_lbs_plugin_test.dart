import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin_platform_interface.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTencentLBSPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterTencentLBSPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterTencentLBSPluginPlatform initialPlatform =
      FlutterTencentLBSPluginPlatform.instance;

  test('$MethodChannelFlutterTencentLBSPlugin is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFlutterTencentLBSPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterTencentLBSPlugin flutterTencentLbsPlugin = FlutterTencentLBSPlugin();
    MockFlutterTencentLBSPluginPlatform fakePlatform =
        MockFlutterTencentLBSPluginPlatform();
    FlutterTencentLBSPluginPlatform.instance = fakePlatform;

    expect(await flutterTencentLbsPlugin.getPlatformVersion(), '42');
  });
}
