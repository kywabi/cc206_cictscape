import 'package:cc206_cictscape/components/chronoroom_drawer.dart';
import 'package:cc206_cictscape/components/home_drawer.dart';
import 'package:cc206_cictscape/components/calebot_drawer.dart';
import 'package:cc206_cictscape/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class CaleBotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CaleBot'),
        backgroundColor: const Color(0xFF215049),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to CaleBot!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    drawer: Drawer(
        child: Container(
          color: const Color(0xFF215049),
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xFF215049),
                ),
                child: const Text(
                  'CICTScape',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              _buildHoverableDrawerItem('Home', Icons.home, () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

              }),
              _buildHoverableDrawerItem('ChronoRoom', Icons.access_time, () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChronoRoom()));
              }),
              _buildHoverableDrawerItem('CaleBot', Icons.chat, () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CaleBotPage()));
                
              }),
              _buildHoverableDrawerItem('Logout', Icons.exit_to_app, () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}


      




  Widget _buildHoverableDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: ListTile(
            title: Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 16),
                Text(title, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}