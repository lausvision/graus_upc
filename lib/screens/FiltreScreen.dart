import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/filters/Branca.dart';
import 'package:graus_upc/filters/Modalitat.dart';
import 'package:graus_upc/filters/Loc.dart';
import 'package:graus_upc/filters/Nota.dart';

class Filtre extends StatefulWidget {
  final Filtrar filtre;
  const Filtre(this.filtre);
  @override
  _FiltreState createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  int _selectedIndex = 1;

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "filtres",
          style: TextStyle(
            color: Colors.black38,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 35.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (int i = 0; i < widget.filtre.filtres.length; i++)
                      _filter(context, widget.filtre.filtres[i]),
                  ],
                ),
              ),
              _camp(context, 'Branca de coneixement'),
              _camp(context, 'Modalitat'),
              _camp(context, 'Localització'),
              _camp(context, 'Nota de tall'),
              DecoratedBox(
                decoration: ShapeDecoration(
                    shape: StadiumBorder(), color: Colors.blue[200]),
                child: OutlineButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'FILTRAR',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  color: Colors.blue[200],
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.of(context).pop(widget.filtre);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context, String valor) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(5, 5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  valor,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (valor == 'Branca de coneixement') {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => Branca(widget.filtre),
            ))
                .then((result) {
              setState(() {
                widget.filtre.branca = result.branca;
                widget.filtre.filtres.add(result.branca);
              });
            });
          } else if (valor == 'Modalitat') {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => Modalitat(widget.filtre),
            ))
                .then((result) {
              setState(() {
                widget.filtre.modalitat = result.modalitat;
                widget.filtre.filtres.add(result.modalitat);
              });
            });
          } else if (valor == 'Localització') {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => Loc(widget.filtre),
            ))
                .then((result) {
              setState(() {
                widget.filtre.loc = result.loc;
                widget.filtre.filtres.add(result.loc);
              });
            });
          } else if (valor == 'Nota de tall') {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => Nota(widget.filtre),
            ))
                .then((result) {
              setState(() {
                widget.filtre.nota = result.nota;
                widget.filtre.filtres.add(result.nota);
              });
            });
          }
        },
      ),
    );
  }

  Widget _filter(BuildContext context, String filtre) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Container(
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
                    filtre,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.white70,
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      widget.filtre.filtres.remove(filtre);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
