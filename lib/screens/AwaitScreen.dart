import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';

class AwaitScreen extends StatefulWidget {
  @override
  _AwaitScreenState createState() => _AwaitScreenState();
}

class _AwaitScreenState extends State<AwaitScreen> {

 @override
 void initState() {
   
    super.initState();
     Timer(Duration(seconds: 2), () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          ));
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
     width: 400,
child: Image.asset(
                'assets/AwaitScreen.jpg',
                fit: BoxFit.cover, 
              ),

      
      ),
      
    );

  }
}