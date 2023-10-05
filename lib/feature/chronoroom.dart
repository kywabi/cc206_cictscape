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
