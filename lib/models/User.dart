import 'package:cloud_firestore/cloud_firestore.dart';

class User {
 String id;

  List<String> favoritos;

  User(
    this.id,
    List<dynamic> notes,
  ) {
    this.favoritos = favoritos.cast<String>();
  }
  
  
    User.fromFirestore(DocumentSnapshot doc) {
    this.id = doc.documentID;
    this.id = doc.data['id'];
 
  }

  toDocument() {
    return {
      'id': this.id,
     
      'favoritos': this.favoritos.cast<dynamic>(),
    };
  }

  
  }

