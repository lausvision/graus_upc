import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:graus_upc/data/llegeix.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

class Loc extends StatefulWidget {
  final Filtrar filtre;
  Loc(this.filtre);
  @override
  _LocState createState() => _LocState();
}

class _LocState extends State<Loc> {
  int _selectedIndex = 1;
  String valor;
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
                'Localització',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              _camp(context),
              //Expanded(child: Locs(index)),
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
                      'Afegeix',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  color: Colors.blue[200],
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _camp(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            valor = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Escriu el nom del centre a buscar.",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
/*
class Locs extends StatefulWidget {
  final String loc;
  const Locs(this.loc);

  @override
  _LocsState createState() => _LocsState();
}

class _LocsState extends State<Locs> {
  filtraLlista(List<String> locs) {
    List<String> grausFiltrats = [];

    if (widget.loc == null) {
      grausFiltrats = locs;
    } else {
      for (int j = 0; j < locs.length; j++) {
        final String nomMinuscules = locs[j].toLowerCase();
        final String filtreMinuscules = widget.loc.toLowerCase();
        if (nomMinuscules.indexOf(filtreMinuscules) != -1) {
          grausFiltrats.add(locs[j]);
        }
      }
    }
    return grausFiltrats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: StreamBuilder(
        stream: Firestore.instance.collection('Graus').orderBy('nom').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');

          List<DocumentSnapshot> documents = snapshot.data.documents;
          List<Grau> locs =[];
              documents.map((doc) => Grau.fromFirestore(doc)).toList();
          List<String> locsFiltre = filtraLlista(locs);

          return ListView.builder(
            itemExtent: 100,
            itemCount: locsFiltre.length,
            itemBuilder: (context, index) =>
                _llista(context, locsFiltre[index]),
          );
        },
      ),
    );
  }

  Widget _llista(BuildContext context, String locsFiltre) {
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
                      locsFiltre,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17),
                      maxLines: 1,
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
                    locsFiltre,
                    style: TextStyle(fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      locsFiltre,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
