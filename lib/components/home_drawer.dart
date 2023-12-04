import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cc206_cictscape/components/chronoroom_drawer.dart';
import 'package:cc206_cictscape/screens/loginscreen.dart';
import 'package:cc206_cictscape/components/calebot_drawer.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

 
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
            title: const Text('Home',
         style: TextStyle(color: Colors.white),),
          backgroundColor: const Color(0xFF215049),
          elevation: 0,
          actions: [
            IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white, // Set the color to white
              size: 28, // Set the size to 28 (adjust as needed)
            ),
              onPressed: () {
                // Handle notification icon tap
              },
            ),
            const SizedBox(width: 15),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              // Add your circle avatar configuration here
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/363498033_253306103991358_2901472721579018923_n.png?stp=dst-png_p160x160&_nc_cat=111&ccb=1-7&_nc_sid=510075&_nc_eui2=AeFLSjv8s83T4jZaqQZGHio-y9tEMTTAyc7L20QxNMDJzvuDKNaJy_oreHG_kcL83kPfeC5VFmo96iIRYX2xO6tV&_nc_ohc=vcdoncZstv0AX9pRFew&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdTljsX5P7RMCl3ofaTYFpSgO46uO4Q31c05D1qKJRiiDQ&oe=6594A97E',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Good Afternoon, Noriel!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getCurrentTime(),
                        style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                         color: const Color(0xFF215049),
                        ),                      
                        textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Available Rooms',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '5',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                         color: const Color(0xFF215049),
                        ),
                      
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
 const SizedBox(height: 30), // Adjust the spacing as needed
        const Text(
          'Rooms',
           style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
        ),

          const SizedBox(height: 8), // Adjust the spacing as needed

        Container(
        height: 350,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: PageView.builder(
            itemCount: 2, // Number of images in the gallery
            itemBuilder: (context, index) {
              return Image.network(
                index == 0
                    ? 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25'
                    : 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
              ],
            ),
          ),
        ),
        ],
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              }),
            ],
          ),
        ),
      ),


    );
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

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute}';
  }
}