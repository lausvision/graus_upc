import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String imageUrl;

  List<String> favoritos;

  User(this.uid, this.name, this.email, this.imageUrl) {
    // Only taking the first part of the name, i.e., First Name
    if (this.name.contains(" ")) {
       this.name = this.name.substring(0, name.indexOf(" "));
    }
  }


  User.fromFirestore(DocumentSnapshot doc) {
    this.uid = doc.documentID;
    this.uid = doc.data['id'];
  }

  toDocument() {
    return {
      'id': this.uid,
      'favoritos': this.favoritos.cast<dynamic>(),
    };
  }
}
