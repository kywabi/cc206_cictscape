import 'package:flutter/material.dart';
import 'package:cc206_cictscape/feature/chronoroom.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: const ChronoRoom(),
    );
  }
}
