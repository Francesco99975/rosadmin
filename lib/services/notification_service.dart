import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const linux = LinuxInitializationSettings(defaultActionName: 'Open');
    // const windows = WindowsInitializationSettings();

    const settings = InitializationSettings(
      android: android,
      linux: linux,
      // windows: windows,
    );

    await _notifications.initialize(settings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? icon,
    String? sound,
  }) async {
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

    // final linuxSound = ThemeLinuxSound("");

    const linuxDetails = LinuxNotificationDetails();

    // const windowsDetails = WindowsNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      linux: linuxDetails,
      // windows: windowsDetails,
    );

    await _notifications.show(id, title, body, details);
  }
}
