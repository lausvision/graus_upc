import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/data/llista.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/screens/FiltreScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Filtrar filtre;
  // Fer una classe simple que agrupi tota la informació de filtrat
  // Afegir estat per saber la informació del filtre (branca, ...)

  TextEditingController editingController = TextEditingController();
  int _selectedIndex = 1;
/*
  @override
  void initState() {
    super.initState();
    filtre = Filtrar(
        filtre.tipo, filtre.loc, filtre.branca, filtre.modalitat, filtre.nota);
  }
*/
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InfoScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  String nom;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filtre.nom = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Filtre(filtre);
                            },
                          ),
                        ).then((result) => {
                              setState(() {
                                filtre = result;
                              })
                            });
                      },
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              Expanded(child: Llista(filtre)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _menu(context),
    );
  }

  Widget _menu(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 13,
      unselectedLabelStyle: TextStyle(fontSize: 11, color: Colors.red),
      unselectedIconTheme: IconThemeData(size: 12, color: Colors.grey[600]),
      backgroundColor: Colors.white,
      iconSize: 24,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text("CALENDAR"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text("HOME"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("PROFILE"),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}

class Filtrar {
  String nom, loc, branca, modalitat;
  double nota;

  Filtrar(
    this.nom,
    this.loc,
    this.branca,
    this.modalitat,
    this.nota,
  );
}
