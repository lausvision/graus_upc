


import 'package:cloud_firestore/cloud_firestore.dart';


createUserCollection(uid) async {
   final db = Firestore.instance;

  DocumentReference ref = await db.collection("user").add({


      'id': uid,
      'favoritos': [],
     
    });

    return ref.documentID;
  }

