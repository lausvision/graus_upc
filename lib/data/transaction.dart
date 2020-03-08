import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


void main() => runApp(new Trans());

class Trans extends StatefulWidget {
  @override
  _TransState createState() => _TransState();
}

class _TransState extends State<Trans> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Preferits')),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                  onPressed: () {
                  
                  }),
              Text(
                'SUMA UN PREFERIT',
              )
            ])),
      ),
    );
  }
}



class Usuaris {
 final int numero;
 final DocumentReference reference;

 Usuaris.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['name'] != null),
       assert(map['votes'] != null),
       numero = map['name'];
      
 Usuaris.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);
}