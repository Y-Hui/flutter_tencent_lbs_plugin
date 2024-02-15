import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tencent_lbs_plugin/flutter_tencent_lbs_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

final instance = FlutterLocalNotificationsPlugin();

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MainApp()),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final locationPlugin = FlutterTencentLBSPlugin();

  @override
  void initState() {
    locationPlugin.setUserAgreePrivacy();
    locationPlugin.init(
      key: "YOUR KEY",
    );
    locationPlugin.addLocationListener((location) {
      print("[[ listener ]]: ${location.toJson()}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                instance
                    .resolvePlatformSpecificImplementation<
                        AndroidFlutterLocalNotificationsPlugin>()
                    ?.requestNotificationsPermission();
              },
              child: const Text("请求 Android 通知权限"),
            ),
            FilledButton(
              onPressed: () {
                Permission.location.request();
              },
              child: const Text("请求定位权限"),
            ),
            FilledButton(
              onPressed: () {
                locationPlugin.getLocationOnce().then(
                  (value) {
                    print("[[ getLocationOnce ]]: ${value?.toJson()}");
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "${value?.address ?? "N/A"}${value?.name ?? "N/A"}",
                          ),
                        );
                      },
                    );
                  },
                  onError: (err) {
                    print("[[ getLocationOnce ERROR ]]: $err");
                  },
                );
              },
              child: const Text("获取一次定位"),
            ),
            FilledButton(
              onPressed: () {
                locationPlugin.getLocation(
                  interval: 1000 * 15,
                  backgroundLocation: true,
                  androidNotificationOptions: AndroidNotificationOptions(
                    id: 100,
                    channelId: "100",
                    channelName: "定位常驻通知",
                    notificationTitle: "定位常驻通知标题文字",
                    notificationText: "定位常驻通知内容文字",
                    // iconData: const NotificationIconData(
                    //   resType: ResourceType.mipmap,
                    //   resPrefix: ResourcePrefix.ic,
                    //   name: 'launcher',
                    //   backgroundColor: Colors.red,
                    // ),
                  ),
                );
              },
              child: const Text("连续定位"),
            ),
            FilledButton(
              onPressed: locationPlugin.stop,
              child: const Text("停止连续定位"),
            ),
          ],
        ),
      ),
    );
  }
}
