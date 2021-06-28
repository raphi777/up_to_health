import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:up_to_health/data/notification.dart';

Future<void> scheduleNotificationDaily() async {
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'seeees',
      'hier könnte eine heftige message stehen',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 20)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          icon: 'launch_background',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);
}

Future<void> scheduleNotificationWeekly() async {
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'seeees',
      'hier könnte eine heftige message stehen',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 20)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          icon: 'launch_background',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void triggerNotifications(List<Notification> userNotifications) {
  // todo
}