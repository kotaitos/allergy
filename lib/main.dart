import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/signin_screen.dart';
import 'tab_page.dart';
import 'firebase_options.dart';

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
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.emailVerified) {
      return MaterialApp(
        title: 'Firebase Auth',
        home: TabPage(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => SigninScreen(),
          '/tab': (_) => TabPage(),
        },
      );
    } else {
      return MaterialApp(
        title: 'Firebase Auth',
        home: SigninScreen(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => SigninScreen(),
          '/tab': (_) => TabPage(),
        },
      );
    }
  }
}
