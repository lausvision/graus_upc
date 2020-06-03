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
                    //actualitza();
                    DocumentReference postRef = Firestore.instance
                        .collection('preferits')
                        .document('compte');
                    DocumentReference ref = Firestore.instance
                        .collection('usuaris')
                        .document('Dq4aZZycvyWZWgkPUcwx');
                    Firestore.instance.runTransaction((Transaction tx) async {
                      DocumentSnapshot postSnapshot = await tx.get(postRef);
                      DocumentSnapshot snapshot = await tx.get(ref);

                      if (postSnapshot.exists) {
                        await tx.update(postRef, <String, dynamic>{
                          'totalpreferits':
                              postSnapshot.data['totalpreferits[0]'] + 1
                        });
                        await tx.update(ref, <String, dynamic>{
                          'preferits': snapshot.data['preferits[0]'] + 1
                        });
                      }
                    });
                  }),
              Text(
                'GRAU 1',
              ),
              /*SizedBox(height: 70),
              IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                  onPressed: () {
                    actualitza();
                  }),
              Text(
                'GRAU 2',
              ),
              SizedBox(height: 70),
              IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                  onPressed: () {
                    actualitza();
                  }),
              Text(
                'GRAU 3',
              )*/
            ])),
      ),
    );
  }
}

actualitza() {
  final DocumentReference postRef = Firestore.instance.document('usuaris');
  Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(postRef);
    if (postSnapshot.exists) {
      await tx.update(postRef,
          <String, dynamic>{'preferits': postSnapshot.data['likesCount'] + 1});
    }
  });
}
