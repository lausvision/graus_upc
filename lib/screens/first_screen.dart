import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/data/llegeix.dart';
import 'package:graus_upc/models/UserAuthProvider.dart';
import 'package:graus_upc/screens/FichaScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/screens/sign_in.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool mostraLlista = false;

  void getIdsxUid() {
    databaseReference
        .collection("Users")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      Map<String, dynamic> ids;
      var listIds = [];
      snapshot.documents.forEach((f) => ids = f.data);
      ids.forEach((k, v) => listIds.add(v));
      print(listIds);
      print(ids);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            WallpaperFoto(),
            LogOutClass(),
            Email(),
            FotoPerfil(),
            Name(),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 175),
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                   getIdsxUid();
                  (mostraLlista
                      ? setState(() {
                          mostraLlista = false;
                        })
                      : setState(() {
                          mostraLlista = true;
                        }));
                },
                child: Text(
                  "Llistat de Preferits",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            (mostraLlista
                ? StreamBuilder(
                    stream: Firestore.instance
                        .collection('Graus')
                        .orderBy('nom')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text('Loading...');

                      List<DocumentSnapshot> documents =
                          snapshot.data.documents;
                      List<Grau> graus = documents
                          .map((doc) => Grau.fromFirestore(doc))
                          .toList();

                      List<Grau> grausFiltratsxId = [];

                     

                      List<String> idsPreferits = [];

                      for (int y = 0; y < idsPreferits.length; y++) {
                        for (int i = 0; i < graus.length; i++) {
                          if (graus[i].id == idsPreferits[y]) {
                            grausFiltratsxId[y] = graus[i];
                          }
                        }
                      }

                      return Container(
                        padding: const EdgeInsets.only(
                            top: 225, left: 5, bottom: 10),
                        child: Scrollbar(
                          child: ListView.builder(
                            // padding: const EdgeInsets.only(top:300,left: 5),
                            itemExtent: 100,
                            itemCount: grausFiltratsxId.length,
                            itemBuilder: (context, index) =>
                                _grau(context, grausFiltratsxId[index]),
                          ),
                        ),
                      );
                    },
                  )
                : Container()),
          ],
        ));
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
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
                    child: Text(
                      grau.nom,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17),
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

class Name extends StatelessWidget {
  const Name({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 175),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0, left: 170),
      child: Text(
        email,
        style: TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FotoPerfil extends StatelessWidget {
  const FotoPerfil({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
          radius: 70,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class WallpaperFoto extends StatelessWidget {
  const WallpaperFoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/marble_op.png"), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LogOutClass extends StatelessWidget {
  const LogOutClass({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = Provider.of<UserAuthProvider>(context);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 320),
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              tooltip: 'Sign out',
              color: Colors.black,
              onPressed: () {
                log.signOut();

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return ProfileScreen();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
