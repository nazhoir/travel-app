import 'package:flutter/material.dart';
// import 'package:travel_app/views/home.dart';
import 'package:travel_app/views/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      home: Landing(),
    );
  }
}
