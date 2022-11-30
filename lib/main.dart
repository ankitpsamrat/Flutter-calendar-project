import 'package:flutter/material.dart';
import 'package:project2/card.dart';
import 'package:project2/home_page.dart';
import 'package:project2/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      // theme: ThemeData(backgroundColor: Colors.red),
      home: const DetailList(),
      routes: {
        'details': (context) => DetailCard(),
      },
    );
  }
}
