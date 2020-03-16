import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:graus_upc/models/Grau.dart';

List<Grau> loadData(List<DocumentSnapshot> docs) {
  //print(docs);
  List<Grau> graus = [];
  for (var i = 0; i < docs.length; i++) {
    List<dynamic> graus = List<String>.from(docs[i].data['Graus']);

    graus.add(
      Grau(
        docs[i].data['nom'],
        docs[i].data['objectius'],
        docs[i].data['modalitat'],
        docs[i].data['link'],
        docs[i].data['foto'],
        docs[i].data['localitzacio'],
        docs[i].data['branca'],
        docs[i].data['ambit'],
        docs[i].data['nota'],
      ),
    );
  }
  return graus;
}
