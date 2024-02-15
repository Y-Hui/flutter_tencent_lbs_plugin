import 'notification_icon_data.dart';

class AndroidNotificationOptions {
  AndroidNotificationOptions({
    required this.id,
    required this.channelId,
    required this.channelName,
    required this.notificationTitle,
    this.notificationText,
    this.channelDescription,
    this.enableVibration = false,
    this.playSound = false,
    this.showWhen = false,
    this.iconData,
  })  : assert(channelId.isNotEmpty),
        assert(channelName.isNotEmpty),
        assert(notificationTitle.isNotEmpty);

  final int id;
  final String channelId;
  final String channelName;
  final String? channelDescription;
  final String notificationTitle;
  final String? notificationText;
  final bool enableVibration;
  final bool playSound;
  final bool showWhen;
  final NotificationIconData? iconData;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'channelName': channelName,
      'channelDescription': channelDescription,
      'enableVibration': enableVibration,
      'notificationTitle': notificationTitle,
      'notificationText': notificationText,
      'playSound': playSound,
      'showWhen': showWhen,
      'iconData': iconData?.toJson(),
    };
  }
}
