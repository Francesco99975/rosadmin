import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final _winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static Future<void> init() async {
    if (!Platform.isWindows) {
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const linux = LinuxInitializationSettings(defaultActionName: 'Open');

      const settings = InitializationSettings(
        android: android,
        linux: linux,
      );

      await _notifications.initialize(settings);
    }
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? icon,
    String? sound,
  }) async {
    if (!Platform.isWindows) {
      const androidDetails = AndroidNotificationDetails(
        'main_channel',
        'Main Notifications',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        icon: '@mipmap/ic_launcher_foreground',
        sound: RawResourceAndroidNotificationSound(
            'order_notif'), // Add `custom_sound.mp3` to `android/app/src/main/res/raw`
        largeIcon:
            DrawableResourceAndroidBitmap('@mipmap/ic_launcher_foreground'),
      );

      const linuxDetails = LinuxNotificationDetails();

      const details = NotificationDetails(
        android: androidDetails,
        linux: linuxDetails,
      );

      await _notifications.show(id, title, body, details);
    } else {
      // create new NotificationMessage instance with id, title, body, and images
      NotificationMessage message = NotificationMessage.fromPluginTemplate(
        id.toString(),
        title,
        body,
      );

      // show notification
      _winNotifyPlugin.showNotificationPluginTemplate(message);
    }
  }
}
