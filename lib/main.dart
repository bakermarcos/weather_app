import 'package:flutter/material.dart';
import 'package:weather_app/core/config/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: const Color(0x14306FFF),
      ),
      home: const Placeholder(),
    );
  }
}