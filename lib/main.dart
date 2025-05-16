import 'package:coba_456/screens/login.dart';
import 'package:coba_456/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:coba_456/screens/home.dart';
import 'package:coba_456/screens/second_screen.dart';
import 'package:coba_456/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Notification Demo',
  //     routes: {
  //       'home': (context) => const HomeScreen(),
  //       'second': (context) => const SecondScreen(),
  //     },
  //     initialRoute: 'home',
  //     navigatorKey: navigatorKey,
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'login', routes: {
      'home': (context) => const HomeScreen(),
      'login': (context) => const LoginScreen(),
      'register': (context) => const RegisterScreen(),
    });
  }
}
