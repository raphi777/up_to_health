import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:up_to_health/data/notification.dart' as notif;

/*Future onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(payload),
              ),
            );
          },
        )
      ],
    ),
  );
}*/

Future<void> scheduleNotification(
    id, title, body, schedule, matchDateTimeComponents) async {
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      schedule,
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
      matchDateTimeComponents: matchDateTimeComponents);
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void triggerNotifications(List<notif.Notification> userNotifications) {
  for (var i = 0; i < userNotifications.length; i++) {
    scheduleNotification(
        userNotifications[i].id,
        userNotifications[i].title,
        userNotifications[i].body,
        userNotifications[i].schedule,
        userNotifications[i].matchDateTimeComponents);
  }
}
