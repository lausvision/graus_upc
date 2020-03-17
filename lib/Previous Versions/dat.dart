import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Graus {
  String nom, branca, modalitat, localitzacio, objectius, ambit, link, foto;
  double nota;

  Graus(this.nom, this.branca, this.modalitat, this.localitzacio,
      this.objectius, this.ambit, this.link, this.foto, this.nota);

  toDocument() {
    return {
      'nom': this.nom,
      'branca': this.branca,
      'modalitat': this.modalitat,
      'localitzacio': this.localitzacio,
      'objectius': this.objectius,
      'ambit': this.ambit,
      'link': this.link,
      'foto': this.foto,
      'nota': this.nota,
    };
  }

  toJson() => toDocument();

  toPrint() {
    print('Nom: ${this.nom}');
    print('Branca: ${this.branca}');
    print('Modalitat: ${this.modalitat}');
    print('Localitzacio: ${this.localitzacio}');
    print('Objectius: ${this.objectius}');
    print('Ambit: ${this.ambit}');
    print('Link: ${this.link}');
    print('Foto: ${this.foto}');
    print('Nota: ${this.nota}');
  }

  factory Graus.fromJson(Map<String, dynamic> json) {
    return new Graus(
        json['nom'] as String,
        json['branca'] as String,
        json['modalitat'] as String,
        json['localitzacio'] as String,
        json['objectius'] as String,
        json['ambit'] as String,
        json['link'] as String,
        json['foto'] as String,
        json['nota'] as double);
  }

  static Graus fromSnapshot(DocumentSnapshot snap) {
    return new Graus(
      snap['nom'] as String,
      snap['branca'] as String,
      snap['modalitat'] as String,
      snap['localitzacio'] as String,
      snap['objectius'] as String,
      snap['ambit'] as String,
      snap['link'] as String,
      snap['foto'] as String,
      snap['nota'] as double,
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/data.json');
}

class Firebase {
  final colGraus = Firestore.instance.collection('Graus');

  Future<void> afegeixGrau(Graus item) async {
    try {
      await colGraus.add(item.toDocument());
      print('Grau afegit');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> generalGraus(List<Graus> items) async {
    items.forEach((item) => afegeixGrau(item));
  }
}

void main() => runApp(new Dat());

class Dat extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Dat> {
  var db = new Firebase();
  List<Graus> graus;
  List<String> result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue[500],
                  onPressed: () {
                    loadAsset().then((res){
                      result=res.split(',');               
                    });
                    //db.afegeixGrau(graus);
                    /*
                    loadAsset().then((resultat){
                      db.generalGraus(resultat);
                    });*/
                  }),
              Text(
                'Dades a firestore',
              )
            ])),
      ),
    );
  }
}
