
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const dynamic fitxer = 'data/data.json';

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

  toString() =>
      '$nom/$branca/$modalitat/$localitzacio/$objectius/$ambit/$link/$foto/$nota';

  Graus.fromJson(Map<String, dynamic> jsonlist)
      : nom = jsonlist['nom'],
        branca = jsonlist['branca'],
        modalitat = jsonlist['modalitat'],
        localitzacio = jsonlist['localitzacio'],
        objectius = jsonlist['objectius'],
        ambit = jsonlist['ambit'],
        link = jsonlist['link'],
        foto = jsonlist['foto'],
        nota = jsonlist['nota'];
}

//llegim la llista que tenim en un arxiu JSON
Future<dynamic> loadAsset() async {
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
                    loadAsset().then((resultat){
                      graus=resultat.split(",");
                      db.generalGraus(graus);
                    });
                  }),
              Text(
                'Dades a firestore',
              )
            ])),
      ),
    );
  }
}
