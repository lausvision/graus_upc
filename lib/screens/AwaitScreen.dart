import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/first_screen.dart';

class AwaitScreen extends StatefulWidget {
  @override
  _AwaitScreenState createState() => _AwaitScreenState();
}

class _AwaitScreenState extends State<AwaitScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      WallpaperFoto(),
      Image(image: AssetImage("assets/logo.png"), height: 300),
    ]));
  }
}
