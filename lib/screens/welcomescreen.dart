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
      home: const WelcomePage(),
      routes: {
        '/homeScreen': (BuildContext ctx) => HomeScreen(),
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
            'https://scontent.fmnl9-4.fna.fbcdn.net/v/t1.15752-9/405846819_1079967129684805_431433535647908935_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeH-ky2CR4sTt2KOcvbpcHaTsss09ltyHpKyyzT2W3IeknpuWCxuKgVpnI7Ewe8-mGjzgVdsgud8CCHi8Tj1h4LS&_nc_ohc=4OLR7N62Up8AX_-2JgX&_nc_ht=scontent.fmnl9-4.fna&oh=03_AdRCbWoHe-yXeV7KZ0hjvHDBxufRxE7C6HOIZ0EN4pxkQg&oe=65951622',
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'with Ease!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Let's Go Button
          Positioned(
            bottom: 70,
            left: 150,
            right: 150,
            child: Container(
              height: 50, // Set the width here
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homeScreen');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Color(0xFF215049),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Color(0xFFFAA001)),
                  ),
                ),
                child: Text(
                  'Let\'s Go',
                  style: TextStyle(
                    color: Color(0xFFFAA001),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
