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
