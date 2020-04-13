import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FichaScreen extends StatefulWidget {
  @override
  _FichaScreenState createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              tooltip: 'Share',
              color: Colors.black,
              onPressed: () {
               
              })
        ],
      ),
      
    );
  }
}