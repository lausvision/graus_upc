import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

class Graus {
  String nom, branca,modalitat,localitzacio,objectius,ambit,link, foto;
  double nota;

  Graus(
    this.nom,
    this.branca,
    this.modalitat,
    this.localitzacio,
    this.objectius,
    this.ambit,
    this.link,
    this.foto,
    this.nota
  );
   
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
      json['nota'] as double
    );
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

Future<List<Graus>> carregaGraus() async {
  List<Graus> result= [];
  Directory dir =await getApplicationDocumentsDirectory();
  File file=File('${dir.path}/data.json');
  String cont=await file.readAsString();
  List json = jsonDecode(cont);
  for (var j in json){
    result.add(new Graus.fromJson(j));
  }  
  return result;
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
                    carregaGraus().then((resultat){
                      db.generalGraus(resultat);
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