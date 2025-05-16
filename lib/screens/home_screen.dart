import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:coba_456/services/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // update a note
  void inputIntervalGopay(BuildContext context) {
    TextEditingController textController = TextEditingController();
    Timer? _timer;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Interval in seconds"),
        content: TextField(controller: textController),
        actions: [
          MaterialButton(
            onPressed: () {
              int interval = int.parse(textController.text);
              NotificationService.startPeriodicNotification(
                id: 1,
                interval: Duration(seconds: interval),
                title: 'Periodic Notification',
                body: 'This is a periodic notification',
              );
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text("Start"),
          ),
          MaterialButton(
            onPressed: () {
              NotificationService.stopPeriodicNotifications();
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text("Stop"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Placeholder for the notification buttons
          OutlinedButton(
            onPressed: () => inputIntervalGopay(context),
            child: const Text('Default Notification'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 2,
                title: 'Notification with Summary',
                body: 'This is the body of the notification',
                summary: 'Small summary',
                notificationLayout: NotificationLayout.Inbox,
              );
            },
            child: const Text('Notification with Summary'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 3,
                title: 'Progress Bar Notification',
                body: 'This is the body of the notification',
                summary: 'Small summary',
                notificationLayout: NotificationLayout.ProgressBar,
              );
            },
            child: const Text('Progress Bar Notification'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 4,
                title: 'Message Notification',
                body: 'This is the body of the notification',
                summary: 'Small summary',
                notificationLayout: NotificationLayout.Messaging,
              );
            },
            child: const Text('Message Notification'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 5,
                title: 'Big Image Notification',
                body: 'This is the body of the notification',
                summary: 'Small summary',
                notificationLayout: NotificationLayout.BigPicture,
                bigPicture: 'https://picsum.photos/300/200',
              );
            },
            child: const Text('Big Image Notification'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 5,
                title: 'Action Button Notification',
                body: 'This is the body of the notification',
                payload: {'navigate': 'true'},
                actionButtons: [
                  NotificationActionButton(
                    key: 'action_button',
                    label: 'Click me',
                    actionType: ActionType.Default,
                  )
                ],
              );
            },
            child: const Text('Action Button Notification'),
          ),
        ],
      ),
    );
  }
}
