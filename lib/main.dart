import 'package:cc206_cictscape/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:cc206_cictscape/screens/homescreen.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoRoom App',
      home: const HomeScreen(),
      routes: {
        '/welcomeScreen': (BuildContext ctx) => WelcomePage(),
        '/homeScreen': (BuildContext ctx) => HomeScreen(),

      },
      initialRoute: '/welcomeScreen',
    );
  }
}
