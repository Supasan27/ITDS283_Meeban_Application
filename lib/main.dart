import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'IntroPage.dart';
import 'LoginPage.dart';
import 'Registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IntroductionPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
