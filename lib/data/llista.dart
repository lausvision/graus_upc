import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/screens/FichaScreen.dart';
import 'package:graus_upc/data/llegeix.dart';

class Llista extends StatefulWidget {
  final String searchString;
  const Llista(this.searchString);

  @override
  _LlistaState createState() => _LlistaState();
}

class _LlistaState extends State<Llista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: StreamBuilder(
        stream:
            Firestore.instance.collection('Graus').orderBy('nom').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');

          List<DocumentSnapshot> documents = snapshot.data.documents;
          List<Grau> graus =
              documents.map((doc) => Grau.fromFirestore(doc)).toList();

          List<Grau> grausFiltrats = [];
          if (widget.searchString == null) {
            grausFiltrats = graus;
          } else {
            for (int i = 0; i < graus.length; i++) {
              final String nomMinuscules = graus[i].nom.toLowerCase();
              final String filtreMinuscules = widget.searchString.toLowerCase();
              if (nomMinuscules.indexOf(filtreMinuscules) != -1) {
                grausFiltrats.add(graus[i]);
              }
            }
          }

          return ListView.builder(
            itemExtent: 100,
            itemCount: grausFiltrats.length,
            itemBuilder: (context, index) =>
                _grau(context, grausFiltrats[index]),
          );
        },
      ),
    );
  }

  Widget _grau(BuildContext context, Grau grau) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 270),
                    child: Text(
                      grau.nom,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17),
                      maxLines: 1,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Text(
                      grau.nota.toString(),
                      
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    grau.loc,
                    style: TextStyle(fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      grau.branca,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FichaScreen(
                    grau.nom,
                    grau.ambit,
                    grau.loc,
                    grau.link,
                    grau.nota.toString(),
                    grau.objectius,
                    grau.foto,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
