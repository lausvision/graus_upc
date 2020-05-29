import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:provider/provider.dart';

class Branca extends StatefulWidget {
  @override
  _BrancaState createState() => _BrancaState();
}

class _BrancaState extends State<Branca> {
  int _selectedIndex = 1;
  List<bool> actius = [false, false, false, false, false];
  List<String> branca = [
    'Enginyeria i Arquitectura',
    'Ciències',
    'Ciències de la Salut',
    'Arts i Humanitats',
    'Ciències Socials i Jurídiques'
  ];

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
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Branca de coneixement',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < branca.length; i++)
                _camp(context, branca[i], i, actius, filtre),
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context, String valor, int i, List<bool> actius,
      Filtrar filtre) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                valor,
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
            ),
            if (actius[i])
              Icon(
                Icons.fiber_manual_record,
                color: Colors.blue[300],
              ),
          ],
        ),
      ),
      onTap: () {
        filtre.afegeixBranca(valor);
        setState(() {
          for (int j = 0; j < branca.length; j++)
            if (j == i)
              actius[j] = true;
            else
              actius[j] = false;
        });
        Navigator.of(context).pop();
      },
    );
  }
}
