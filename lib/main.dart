
import 'package:flutter/material.dart';
import 'package:graus_upc/screens/AwaitScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
       
        body:AwaitScreen(),
      )
    );
  }
}
