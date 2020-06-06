import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/screens/FichaScreen.dart';
import 'package:graus_upc/data/llegeix.dart';
import 'package:provider/provider.dart';

class Llista extends StatefulWidget {
  @override
  _LlistaState createState() => _LlistaState();
}

class _LlistaState extends State<Llista> {
  filtraLlista(List<Grau> graus) {
    final filtre = Provider.of<Filtrar>(context);

    // Filtrem per nom si el nom és != null
    List<Grau> grausFiltrats = [];
    if (filtre.nom == null) {
      grausFiltrats = graus;
    } else {
      for (int j = 0; j < graus.length; j++) {
        final String nomMinuscules = graus[j].nom.toLowerCase();
        final String filtreMinuscules = filtre.nom.toLowerCase();
        if (nomMinuscules.indexOf(filtreMinuscules) != -1) {
          grausFiltrats.add(graus[j]);
        }
      }
    }

    // Filtre per conceptes
    List<Grau> grausFinals = [];
    for (int i = 0; i < grausFiltrats.length; i++) {
      final Filtrar F = filtre;
      final Grau G = grausFiltrats[i];
      if (F.compleixBranca(G) &&
          F.compleixLoc(G) &&
          F.compleixModalitat(G) &&
          F.compleixNota(G)) {
        grausFinals.add(G);
      }
    }
    return grausFinals;
  }

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

          List<Grau> grausFiltrats = filtraLlista(graus);

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
      color: Colors.white70.withOpacity(0.7),
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
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
                    child: Text(
                      grau.nom,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      maxLines: 1,
                    ),
                  ),
                  Expanded(child: Container()),
                  if (grau.nota != null)
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
                  Container(
                    constraints: BoxConstraints(
                        minWidth: 100, maxWidth: 150, maxHeight: 17),
                    child: Text(
                      grau.loc,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14,color: Colors.blueGrey[500]),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      grau.branca,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 14,color: Colors.pink[200]),
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
                  return FichaScreen(grau.nom, grau.ambit, grau.loc, grau.link,
                      grau.nota.toString(), grau.objectius, grau.foto, grau.id);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
