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
  String index;

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
                    setState(() {
                      index = value;
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
                              return Filtre();
                            },
                          ),
                        ) /*.then((result) {
                          if (result != null) {
                            setState(() {
                              filtre = result;
                              print(filtre);
                            });
                          }
                        })*/
                            ;
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

class ItemNota {
  String operador;
  double nota;
  ItemNota(this.operador, this.nota);
}

class Filtrar with ChangeNotifier {
  // String nom, loc, branca, nota, operador;
  String nom, modalitat;
  List<String> branca;
  List<String> loc;
  List<ItemNota> nota;

  Filtrar() {
    /* 
    loc = '';
    branca = '';
    nota = '';
    operador = ''; */
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

  void afegeixBranca(String b) {
    if (!branca.contains(b)) {
      this.branca.add(b);
    }
    notifyListeners();
  }

  void afegeixMod(String mod) {
    modalitat=mod;
    notifyListeners();
  }

  void afegeixLoc(String b) {
    if (!branca.contains(b)) {
      this.branca.add(b);
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

  bool compleixLoc(Grau g) => true;

  bool compleixModalitat(Grau g) => true;

  bool compleixNota(Grau g) => true;
}

/*


        if (F.modalitat != null &&
          G.modalitat.toLowerCase().indexOf(F.modalitat) != -1) {
          afegir = true;
        } 

      if (F.branca != null && G.branca.toLowerCase().indexOf(F.branca) != -1) {
        afegir = true;
      } else  else if (F.loc != null && G.loc.toLowerCase().indexOf(F.loc) != -1) {
        afegir = true;
      } else if (F.nota != null &&
          G.nota.toString().toLowerCase().indexOf(F.nota) != -1) {
        afegir = true;
      }
      if (afegir) {
      }

*/
