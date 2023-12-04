import 'package:cc206_cictscape/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChronoRoom());
}

class ChronoRoom extends StatelessWidget {
  const ChronoRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            hintColor: Colors.green,
            colorScheme: const ColorScheme.light(primary: Colors.green),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ))!;

    if (picked != DateTime.now()) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = (await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ))!;

    setState(() {
      _timeController.text = picked.format(context);
    });
  }

  void _redirectToResultsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          chosenDate: _dateController.text,
          chosenTime: _timeController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChronoRoom',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF215049),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://res.cloudinary.com/generative-ai-demos/image/upload//c_pad,w_2959,ar_4:3,b_gen_fill/f_auto/q_auto/v1/ugc/fill/kohwtjoh7frcwsemsvy8',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: IgnorePointer(
                      child: Container(
                        width: 280,
                        child: TextField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Select Date',
                            labelStyle: const TextStyle(color: Colors.white),
                            suffixIcon: const Icon(Icons.calendar_today, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _selectTime(context),
                    child: IgnorePointer(
                      child: Container(
                        width: 280,
                        child: TextField(
                          controller: _timeController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Select Time',
                            labelStyle: const TextStyle(color: Colors.white),
                            suffixIcon: const Icon(Icons.access_time, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: _redirectToResultsPage,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color(0xFF215049),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Color(0xFFFAA001)),
                        ),
                      ),
                      child: Text(
                        'Find',
                        style: TextStyle(color: Color(0xFF215049)),
                      ),
                    ),
                  ),
                ),
              ],
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
                  '',
                  style: TextStyle(
                    color: Colors.white,
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
    // Handle the selection of tabs
  }
}


class ResultsPage extends StatelessWidget {
  final String chosenDate;
  final String chosenTime;

  ResultsPage({required this.chosenDate, required this.chosenTime});

  // Sample room data (replace it with your actual data)
  final List<Room> rooms = [
    Room('Room 1', 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25', '10:00 AM','1:00 PM'),
    Room('Room 2', 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25', '11:00 AM','12:30 PM'),
    Room('Room 3', 'https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/53930136_776019412782766_9122340675042410496_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=300f58&_nc_eui2=AeHsL6qAjdqcy8eH_YKf9SExOjqihNER30o6OqKE0RHfSm5Wb7jyoPPZA_b_NbabtMlvT_yaiEbcRKHYDRLFToDF&_nc_ohc=rndTAwGf2TwAX_j_j4G&_nc_ht=scontent.fmnl4-6.fna&oh=00_AfASQELxV1idrMXcYkAUAAqlyj-EfO_TL6PhvuTU5wH1_g&oe=65851D25', '2:00 PM','3:30 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF215049),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Results',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              '$chosenDate $chosenTime',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://res.cloudinary.com/generative-ai-demos/image/upload//c_pad,w_2959,ar_4:3,b_gen_fill/f_auto/q_auto/v1/ugc/fill/kohwtjoh7frcwsemsvy8',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: rooms.map((room) {
              return Container(
                margin: const EdgeInsets.all(16.0),
                width: 350,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
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
                        ),
                        child: Image.network(
                          room.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.black.withOpacity(0.7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time: ${room.startTime} - ${room.endTime}',
                                style: TextStyle(color: Colors.white),
                              ),

                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.black.withOpacity(0.7),
                          child: Text(
                            room.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Room {
  final String name;
  final String imageUrl;
  final String startTime;
  final String endTime;

  Room(this.name, this.imageUrl, this.startTime, this.endTime);
}
