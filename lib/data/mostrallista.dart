import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
  

class Llista extends StatefulWidget {
  const Llista({
    Key key,
  }) : super(key: key);

  @override
  _LlistaState createState() => _LlistaState();
}

class _LlistaState extends State<Llista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance
          .collection('Graus')
          .orderBy('nom')
          .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return FloatingSearchBar.builder(
              //itemExtent: 100,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _product(context, snapshot.data.documents[index]),
            );
          }),
    );
  }

  Widget _product(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      document['nom'],
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Align(
                        alignment: Alignment(0.90, -0.90),
                        child: Text(
                          document['nota'].toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Text(
                document['localitzacio'],
                style: TextStyle(fontSize: 12),
              ),
              Text(
                
                document['branca'],
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
