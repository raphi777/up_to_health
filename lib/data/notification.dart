import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class Notification {
  int id;
  String title;
  String body;
  TZDateTime schedule;
  DateTimeComponents matchDateTimeComponents;

  Notification({this.id, this.title, this.body, this.schedule, this.matchDateTimeComponents});
}