import 'package:cc206_cictscape/screens/loginscreen.dart';
import 'package:cc206_cictscape/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:cc206_cictscape/components/home_drawer.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoRoom App',
      home: const LoginPage(),
      routes: {
        '/welcomeScreen': (BuildContext ctx) => WelcomePage(),
        '/loginPage': (BuildContext ctx) => LoginPage(),
        '/homeScreen': (BuildContext ctx) => HomeScreen(),
      },
      initialRoute: '/welcomeScreen',
    );
  }
}
