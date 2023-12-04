import 'package:flutter/material.dart';
import 'package:cc206_cictscape/screens/loginscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoRoom App',
      home: const WelcomePage(),
      routes: {
        '/loginPage': (BuildContext ctx) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://scontent.fcgy2-2.fna.fbcdn.net/v/t1.15752-9/386873400_694100779485092_5554559377775340637_n.png?_nc_cat=111&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeFTImpDKZl9z3Q6JD22p2AkEXZSrwrduTURdlKvCt25NXu2uw7dHnr9SEU04GVm5nBU_xN67MqM4pM72crSSN6C&_nc_ohc=YKTbYdQgyPgAX-dQ5aq&_nc_ht=scontent.fcgy2-2.fna&oh=03_AdSBcQI2gvYW3V3JMzm7XnWJtjSO98yrMI_6v-LnsdfpPQ&oe=65957625',
            fit: BoxFit.cover,
          ),
          // Welcome Text
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Text.rich(
              TextSpan(
                text: 'Reserving you\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                children: [
                  TextSpan(
                    text: 'with Ease!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Let's Go Button
          Positioned(
            bottom: 40,
            left: 125,
            right: 115,
            child: Container(
              height: 40, // Set the width here
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Color(0xFF215049),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Color(0xFF215049)),
                  ),
                ),
                child: Text(
                  'Let\'s Go!',
                  style: TextStyle(
                    color: Color(0xFF215049),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
