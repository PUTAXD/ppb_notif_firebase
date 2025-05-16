import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coba_456/screens/login.dart';
import 'package:coba_456/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void inputDurationPeriodic(BuildContext context) {
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
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
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
        ],
      ),
    );
  }

  void logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                ' ${snapshot.data?.email}',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.purple,
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                OutlinedButton(
                  onPressed: () => inputDurationPeriodic(context),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                          color: Color.fromARGB(255, 118, 109, 33), width: 2),
                    ),
                  ),
                  child: const Text(
                    'Periodic Notification',
                    style: TextStyle(
                      color: Color.fromARGB(255, 104, 95, 14),
                    ),
                  ),
                ),
                // Placeholder for the notification buttons

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
                OutlinedButton(
                  onPressed: () => {
                    logout(context),
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  child:
                      const Text("Logout", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                NotificationService.stopPeriodicNotifications();
              },
              child: Icon(Icons.stop), // Ikon tanda stop
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
