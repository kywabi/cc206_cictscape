import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cc206_cictscape/components/chronoroom_drawer.dart';
import 'package:cc206_cictscape/screens/loginscreen.dart';
import 'package:cc206_cictscape/components/calebot_drawer.dart';
import 'package:intl/intl.dart';

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
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF215049),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                // Handle notification icon tap
              },
            ),
            const SizedBox(width: 15),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
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
                  'https://scontent.fcgy2-1.fna.fbcdn.net/v/t1.15752-9/403406831_320328217596264_377399936506552992_n.png?_nc_cat=106&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeH89B2y14xoWco2q-gNCkrxSuwEKjsxX3hK7AQqOzFfeIU4VecnysFapjHkM8-lt1vgeh8LA_EN6yVXZND-A3OA&_nc_ohc=ovKvgYVJ8k8AX_vh5zb&_nc_ht=scontent.fcgy2-1.fna&oh=03_AdRE3Pk_qSIOjaAqWkiYAUFdnT_nBjqCLobMxeus-GekqA&oe=65956F61',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 340,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Good Afternoon, Noriel!',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'TIME',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _getCurrentTime(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF215049),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
                      const SizedBox(width: 1),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'AVAILABLE ROOMS',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 30,
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
                  const SizedBox(height: 70), // Adjust the spacing as needed
                  const Text(
                    'Available Room',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20), // Adjust the spacing as needed

                  Container(
                    height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _buildImageSlideshow(),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
              _buildHoverableDrawerItem('ChronoRoom', Icons.access_time, () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ChronoRoom()));
              }),
              _buildHoverableDrawerItem('CaleBot', Icons.chat, () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CaleBotPage()));
              }),
              _buildHoverableDrawerItem('Logout', Icons.exit_to_app, () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildImageSlideshow() {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      index == 0
                          ? 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25'
                          : index == 1
                              ? 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25'
                              : 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25'
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 8.0,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    index == 0
                        ? 'ICT 201'
                        : index == 1
                            ? 'ICT 205'
                            : 'ICT 303',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  Widget _buildHoverableDrawerItem(
      String title, IconData icon, VoidCallback onTap) {
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
  final formattedTime = DateFormat.jm().format(now); // 12-hour format
  return formattedTime;
}
}
