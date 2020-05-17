import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/data/llegeix.dart';
import 'package:graus_upc/data/llista.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/screens/FiltreScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Fer una classe simple que agrupi tota la informació de filtrat
  // Afegir estat per saber la informació del filtre (branca, ...)

  TextEditingController editingController = TextEditingController();
  int _selectedIndex = 1;
  String paraula;

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

  @override
  Widget build(BuildContext context) {
    final filtre = Provider.of<Filtrar>(context);

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
                    filtre.modificaNom(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Filtre();
                            },
                          ),
                        );
                      },
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  for (int i = 0; i < filtre.filtres.length; i++)
                    _filter(context, i, filtre),
                ],
              ),
              Expanded(child: Llista()),
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

  Widget _filter(BuildContext context, int i, Filtrar filtre) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.black),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              filtre.filtres[i],
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
          IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white70,
            iconSize: 18.0,
            onPressed: () {
              filtre.modificaFiltres(filtre.filtres[i]);
            },
          ),
        ],
      ),
    );
  }
}

class ItemNota {
  String operador;
  double nota;
  ItemNota(this.operador, this.nota);
}

class Filtrar with ChangeNotifier {
  String nom, modalitat;
  List<String> branca;
  List<String> loc;
  List<ItemNota> nota;

  Filtrar() {
    nom = '';
    branca = [];
    loc = [];
    nota = [];
    modalitat = '';
  }

  get filtres {
    List<String> f = [];
    for (var b in branca) f.add(b);
    for (var l in loc) f.add(l);
    for (var n in nota) f.add("${n.operador}${n.nota}");
    if (modalitat != '') f.add(modalitat);
    return f;
  }

  Filtrar.fromFirestore(DocumentSnapshot doc) {
    this.loc = doc.data['loc'];
  }

  void modificaFiltres(String f) {
    for (int i = 0; i < branca.length; i++) {
      if (f == branca[i]) branca.remove(branca[i]);
    }

    if (f == modalitat) modalitat = '';

    for (int i = 0; i < loc.length; i++) {
      if (f == loc[i]) loc.remove(loc[i]);
    }

    for (int i = 0; i < nota.length; i++) {
      if (f == "${nota[i].operador}${nota[i].nota}") nota.remove(nota[i]);
    }
    notifyListeners();
  }

  void modificaNom(String n) {
    nom = n;
    notifyListeners();
  }

  void afegeixBranca(String b) {
    if (!branca.contains(b)) {
      this.branca.add(b);
    }
    notifyListeners();
  }

  void modificaMod(String m) {
    modalitat = m;
    notifyListeners();
  }

  void afegeixLoc(String b) {
    if (!loc.contains(b)) {
      this.loc.add(b);
    }
    notifyListeners();
  }

  void afegeixNota(String op, double nota) {
    this.nota.add(ItemNota(op, nota));
    notifyListeners();
  }

  bool compleixBranca(Grau g) {
    if (branca.length == 0) {
      return true;
    }
    for (int i = 0; i < branca.length; i++) {
      if (branca[i] == 'Ciències' &&
          (g.branca == 'Ciències socials i jurídiques' ||
              g.branca == 'Ciències de la salut')) return false;
      if (g.branca.toLowerCase().indexOf(branca[i].toLowerCase()) != -1) {
        return true;
      }
    }
    return false;
  }

  bool compleixLoc(Grau g) {
    if (loc.length == 0) {
      return true;
    }
    for (int i = 0; i < loc.length; i++) {
      if (g.loc.toLowerCase().indexOf(loc[i].toLowerCase()) != -1) {
        return true;
      }
    }
    return false;
  }

  bool compleixModalitat(Grau g) {
    if (modalitat != null &&
        g.modalitat.toLowerCase().indexOf(modalitat.toLowerCase()) != -1) {
      return true;
    }
    return false;
  }

  bool compleixNota(Grau g) {
    if (nota.length == 0) {
      return true;
    }
    if (nota[0].nota != 0)
      for (int i = 0; i < nota.length; i++) {
        if (nota[i].operador == '=') {
          if (g.nota
                  .toString()
                  .toLowerCase()
                  .indexOf(nota[i].nota.toString().toLowerCase()) ==
              -1) {
            return false;
          }
        } else if (nota[i].operador == '<') {
          if (g.nota >= nota[i].nota) {
            return false;
          }
        } else if (nota[i].operador == '>') {
          if (g.nota <= nota[i].nota) {
            return false;
          }
        }
      }
    return true;
  }
}
