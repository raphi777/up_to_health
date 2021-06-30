import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/data/user_notifications.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:up_to_health/data/notification.dart' as notif;
import 'package:up_to_health/services/local_notify_manager.dart';

class NotificationsPage extends StatefulWidget {
  final UthUser uthUser;

  NotificationsPage(this.uthUser);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }

  List<bool> switchStatusList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<notif.Notification> _NotificationsList =
        UserNotifications().getNotifications(widget.uthUser);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benachrichtigungen'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: Text(
                "Sag uns welche Benachrichtigungen du bekommen möchtest.",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _NotificationsList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_NotificationsList[index].title),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterSwitch(
                          value: switchStatusList[index],
                          onToggle: (val) {
                            setState(() {
                              switchStatusList[index] = val;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
          ElevatedButton(
            onPressed: () {
              localNotifyManager.triggerNotifications(
                  UserNotifications().getNotifications(widget.uthUser));
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
