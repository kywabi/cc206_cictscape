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
  // ignore: library_private_types_in_public_api
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
            primaryColor: Colors.green, // Header background color
            // ignore: deprecated_member_use
            hintColor: Colors.green, // Selected date color
            colorScheme: const ColorScheme.light(primary: Colors.green),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ))!;

    if (picked != DateTime.now()) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0]; // Display only the date
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
        title: const Text('ChronoRoom'),
      ),
      body: Stack(
        children: [
               // Background Image
          Image.network(
            'https://scontent.fklo1-1.fna.fbcdn.net/v/t1.15752-9/363498033_253306103991358_2901472721579018923_n.png?_nc_cat=111&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeFLSjv8s83T4jZaqQZGHio-y9tEMTTAyc7L20QxNMDJzvuDKNaJy_oreHG_kcL83kPfeC5VFmo96iIRYX2xO6tV&_nc_ohc=EYvjvjz0aHAAX_uGjvl&_nc_ht=scontent.fklo1-1.fna&oh=03_AdTnl51yXAOslHrqJaQTttG5dIrAeceVOuXJRMfFRu-H4g&oe=655DF33E',
            width: double.infinity,
            height: double.infinity,
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
                  decoration: const InputDecoration(
                      labelText: 'Select Date',
                      labelStyle: TextStyle(color: Colors.white), // Set text color to white
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
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
                            labelStyle: TextStyle(color: Colors.white), // Set text color to white
                            suffixIcon: Icon(Icons.access_time, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}