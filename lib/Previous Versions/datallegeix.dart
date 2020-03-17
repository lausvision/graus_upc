import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

const dynamic fitxer = 'data.json';

class Graus {
  final String nom,
      branca,
      modalitat,
      localitzacio,
      objectius,
      ambit,
      link,
      foto,
      nota;

  Graus(this.nom, this.branca, this.modalitat, this.localitzacio,
      this.objectius, this.ambit, this.link, this.foto, this.nota);

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

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'branca': branca,
        'modalitat': modalitat,
        'localitzacio': localitzacio,
        'objectius': objectius,
        'ambit': ambit,
        'link': link,
        'foto': foto,
        'nota': nota
      };
}

//llegim la llista que tenim en un arxiu JSON
List<dynamic> llegirLlista() {
  var text = File(fitxer).readAsStringSync(); //el arxiu el passem a string

  var jsontext = jsonDecode(text); //llista de maps

  return jsontext; //tornem llista normal
}

//funcio que mostra per pantalla la llista
void mostraLlista(List<dynamic> llista) {
  for (int i = 0; i < llista.length; i++) {
    var info = Graus.fromJson(llista[i]);
    print("${i + 1}:");
    print("nom: ${info.nom}");
    print("branca: ${info.branca}");
    print("modalitat: ${info.modalitat}");
    print("localitzacio: ${info.localitzacio}");
    print("objectius: ${info.objectius}");
    print("ambit: ${info.ambit}");
    print("link: ${info.link}");
    print("foto: ${info.foto}");
    print("nota: ${info.nota}");
  }
}

class Firebase {
  final colGraus = Firestore.instance.collection('Graus');

  Future<void> afegeixGrau(Graus item) async {
    try {
      await colGraus.add(item.toJson());
      print('Grau afegit');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> generalGraus(List<Graus> items) async {
    items.forEach((item) => afegeixGrau(item));
  }
}

void main() => runApp(new Datab());

class Datab extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Datab> {
  var db = new Firebase();
  List<Graus> graus = [];

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
                    graus = llegirLlista();
                    db.generalGraus(graus);
                  }),
              Text(
                'Dades a firestore',
              )
            ])),
      ),
    );
  }
}
