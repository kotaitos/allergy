import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/authentication_screen.dart';
import 'screens/home_screen.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) {
      return MaterialApp(
        title: 'Firebase Auth',
        home: Home(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => Authentication(),
          '/home': (_) => Home(),
        },
      );
    } else {
      return MaterialApp(
        title: 'Firebase Auth',
        home: Authentication(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => Authentication(),
          '/home': (_) => Home(),
        },
      );
    }
  }
}