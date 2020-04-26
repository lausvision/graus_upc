import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/screens/FichaScreen.dart';
import 'package:graus_upc/data/llegeix.dart';

class Select extends StatefulWidget {
  final String camp;
  const Select(this.camp);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            Firestore.instance.collection('Graus').orderBy('nom').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');

          List<DocumentSnapshot> documents = snapshot.data.documents;
          List<Grau> graus =
              documents.map((doc) => Grau.fromFirestore(doc)).toList();

          List<Grau> grausFiltrats = [];

          for (int i = 0; i < graus.length; i++) {
            final String filtreMinuscules = widget.camp.toLowerCase();
            if (graus[i].branca.toLowerCase().indexOf(filtreMinuscules) != -1) {
              grausFiltrats.add(graus[i]);
            } else if (graus[i]
                    .modalitat
                    .toLowerCase()
                    .indexOf(filtreMinuscules) !=
                -1) {
              grausFiltrats.add(graus[i]);
            } else if (graus[i].loc.toLowerCase().indexOf(filtreMinuscules) !=
                -1) {
              grausFiltrats.add(graus[i]);
            } else if (graus[i]
                    .nota
                    .toString()
                    .toLowerCase()
                    .indexOf(filtreMinuscules) !=
                -1) {
              grausFiltrats.add(graus[i]);
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
                  Text(
                    grau.nom,
                    style: TextStyle(fontSize: 16),
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
