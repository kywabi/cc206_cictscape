import 'package:cc206_cictscape/components/home_drawer.dart';
import 'package:flutter/material.dart';

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
        '/homeScreen': (BuildContext ctx) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://scontent.xx.fbcdn.net/v/t1.15752-9/363498033_253306103991358_2901472721579018923_n.png?stp=dst-png_p160x160&_nc_cat=111&ccb=1-7&_nc_sid=510075&_nc_eui2=AeFLSjv8s83T4jZaqQZGHio-y9tEMTTAyc7L20QxNMDJzvuDKNaJy_oreHG_kcL83kPfeC5VFmo96iIRYX2xO6tV&_nc_ohc=vcdoncZstv0AX9pRFew&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdTljsX5P7RMCl3ofaTYFpSgO46uO4Q31c05D1qKJRiiDQ&oe=6594A97E',
            fit: BoxFit.cover,
          ),
          // Welcome Text
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Text.rich(
              TextSpan(
                text: 'Let\'s Get\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Started!',
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
                // Email Input
      Positioned(
        top: 300,
        left: 50,
        right: 50,
        child: TextFormField(
          style: TextStyle(color: Color(0xFF215049)), // Set text color
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Color(0xFF215049)),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xFF215049), // Set icon color
            ),
            filled: true,
            fillColor: Colors.white, // Set background color
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF215049)),
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFAA001)),
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Set vertical padding
          ),
        ),
      ),

      // Password Input
      Positioned(
        top: 380,
        left: 50,
        right: 50,
        child: TextFormField(
          obscureText: true,
          style: TextStyle(color: Color(0xFF215049)), // Set text color
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Color(0xFF215049)),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF215049), // Set icon color
            ),
            filled: true,
            fillColor: Colors.white, // Set background color
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF215049)),
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFAA001)),
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Set vertical padding
          ),
        ),
      ),
                
// Login Button
Positioned(
  bottom: 70,
  left: 150,
  right: 150,
  child: Container(
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        print("Login button pressed"); // Add this line for debugging
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );

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
        'Login',
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