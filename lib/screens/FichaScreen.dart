import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FichaScreen extends StatefulWidget {
  @override
  _FichaScreenState createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("Sample"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              padding: const EdgeInsets.only(right: 35.0),
              icon: Icon(Icons.favorite_border),
              tooltip: 'Share',
              color: Colors.black,
              onPressed: () {}),
          IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(Icons.share),
              tooltip: 'Share',
              color: Colors.black,
              onPressed: () {}),
        ],
      ),
      body: StreamBuilder(
          stream:
              Firestore.instance.collection('Graus').orderBy('nom').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Descripció:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[50],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'vflkdkyfugihuugfdysyghlgkdfsgk',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Sortides professionals: ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[50],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
