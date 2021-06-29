import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/services/notification_service.dart';
import 'package:up_to_health/data/user_notifications.dart';

class NotificationsPage extends StatefulWidget {
  final UthUser uthUser;

  NotificationsPage(this.uthUser);
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
          triggerNotifications(UserNotifications().getNotifications(widget.uthUser));
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
