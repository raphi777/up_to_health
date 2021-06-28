import 'package:flutter/material.dart';
import 'package:up_to_health/services/notification_service.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benachrichtigungen'),
      ),
      body: ElevatedButton(
        onPressed: () {
          scheduleNotificationDaily();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
