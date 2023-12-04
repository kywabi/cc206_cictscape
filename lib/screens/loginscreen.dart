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
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://scontent.fcgy2-1.fna.fbcdn.net/v/t1.15752-9/403406831_320328217596264_377399936506552992_n.png?_nc_cat=106&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeH89B2y14xoWco2q-gNCkrxSuwEKjsxX3hK7AQqOzFfeIU4VecnysFapjHkM8-lt1vgeh8LA_EN6yVXZND-A3OA&_nc_ohc=ovKvgYVJ8k8AX_vh5zb&_nc_ht=scontent.fcgy2-1.fna&oh=03_AdRE3Pk_qSIOjaAqWkiYAUFdnT_nBjqCLobMxeus-GekqA&oe=65956F61',
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
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                children: [
                  TextSpan(
                    text: 'Started!',
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
                // Email Input
      Positioned(
        top: 300,
        left: 50,
        right: 50,
        height: 50,
        child: TextFormField(
          style: TextStyle(color: Color(0xFF215049)), // Set text color
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
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
              borderSide: BorderSide(color: Color(0xFF215049)),
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
        height: 50,
        child: TextFormField(
          obscureText: true,
          style: TextStyle(color: Color(0xFF215049)), // Set text color
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
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
              borderSide: BorderSide(color: Color(0xFF215049)),
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Set vertical padding
          ),
        ),
      ),
                
// Login Button
Positioned(
  bottom: 40,
  left: 125,
  right: 115,
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
          side: BorderSide(color: Color(0xFF215049)),
        ),
      ),
      child: Text(
        'Login',
        style: TextStyle(
          color: Color(0xFF215049),
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