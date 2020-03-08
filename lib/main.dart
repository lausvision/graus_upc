import 'package:flutter/material.dart';
//import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/data/datallegeix.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProfileScreen(),
      ),
    );
  }
}