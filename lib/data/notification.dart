import 'package:timezone/timezone.dart';

class Notification {
  String id;
  String title;
  String body;
  TZDateTime schedule;

  Notification({this.id, this.title, this.body, this.schedule});
}