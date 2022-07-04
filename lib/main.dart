import 'package:flutter/material.dart';
import 'package:travel_app/views/landing.dart';
import 'package:supabase/supabase.dart';

Future<void> main() async {
  final client = SupabaseClient('https://jvmnhdwqrpztylmhminx.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp2bW5oZHdxcnB6dHlsbWhtaW54Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY1Njk2ODA5MywiZXhwIjoxOTcyNTQ0MDkzfQ.peHIKCKXNz5v--IN_0W7QneYXgGnglYP9e45O1s5irc');

  // Select from table `countries` ordering by `name`
  final response = await client
      .from('countries')
      .select()
      .order('name', ascending: true)
      .execute();
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