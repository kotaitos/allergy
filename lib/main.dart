import 'package:allergy/ui/widgets/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:allergy/l10n/l10n.dart';
import 'ui/screens/signin_screen.dart';
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
        title: 'allergy',
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: ButtomNavigationBar(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => SigninScreen(),
          '/home': (_) => ButtomNavigationBar(),
        },
      );
    } else {
      return MaterialApp(
        title: 'allergy',
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        home: SigninScreen(),
        routes: <String, WidgetBuilder>{
          '/signin': (_) => SigninScreen(),
          '/home': (_) => ButtomNavigationBar(),
        },
      );
    }
  }
}
