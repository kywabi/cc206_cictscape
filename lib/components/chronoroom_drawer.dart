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
      debugShowCheckedModeBanner: false, // Remove the debug banner
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChronoRoom',
         style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF215049),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: IgnorePointer(
                      child: Container(
                        width: 280, // Adjust the width as needed
                        child: TextField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Select Date',
                            labelStyle: const TextStyle(color: Colors.white), // Set text color to white
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
                        width: 280, // Adjust the width as needed
                        child: TextField(
                          controller: _timeController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Select Time',
                            labelStyle: const TextStyle(color: Colors.white), // Set text color to white
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
    width: 100, // Adjust the width as needed
    child: ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Set the background color to white
        onPrimary: Color(0xFF215049), // Set the text color to Color(0xFF215049)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
          side: BorderSide(color: Color(0xFFFAA001)), // Set the border color
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
    color: const Color(0xFF215049), // Set the background color of the drawer
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

