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
    f.add(modalitat);
    return f;
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
    if (modalitat != null && modalitat.toLowerCase().indexOf(modalitat) != -1) {
      return true;
    }
    return false;
  }

  bool compleixNota(Grau g) {
    if (nota.length == 0) {
      return true;
    }
    for (int i = 0; i < nota.length; i++) {
      if (g.nota
              .toString()
              .toLowerCase()
              .indexOf(nota[i].toString().toLowerCase()) !=
          -1) {
        return false;
      }
    }
    return true;
  }
}
