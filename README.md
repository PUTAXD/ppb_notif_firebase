
# Firebase & Notification

1. Login Page
![Alt flutter3](https://github.com/PUTAXD/ppb_notif_firebase/blob/main/github_assets/flutter3.png)
2. Home Page
![Alt flutter1](https://github.com/PUTAXD/ppb_notif_firebase/blob/main/github_assets/flutter1.png)
3. Start Periodic Notification and Stop Periodic Notification
```dart

  static void startPeriodicNotification({
    required int id,
    required Duration interval,
    required String title,
    required String body,
  }) {
    _timer = Timer.periodic(
      interval, // repeat at the specified interval
      (timer) async {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: title,
            body: body,
          ),
        );
      },
    );
  }

  static void stopPeriodicNotifications() {
    _timer?.cancel();
    _timer = null;
  }
```
![Alt flutter2](https://github.com/PUTAXD/ppb_notif_firebase/blob/main/github_assets/flutter2.png)



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
