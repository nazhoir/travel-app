import 'package:flutter/material.dart';
import 'package:travel_app/views/landing.dart';
// import 'package:supabase/supabase.dart';

Future<void> main() async {
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

// 2fqN3dQ3r9p@396