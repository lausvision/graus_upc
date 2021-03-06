import 'package:flutter/material.dart';
import 'package:graus_upc/main.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:provider/provider.dart';

class Loc extends StatefulWidget {
  @override
  _LocState createState() => _LocState();
}

class _LocState extends State<Loc> {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Localització',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40.0,
                  width: 280.0,
                  child: OutlineButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search),
                        SizedBox(width: 8.0),
                        Text(
                          'Busca la localització a cercar.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    shape: StadiumBorder(),
                    highlightColor: Colors.blueAccent,
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    },
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 6,
                  children: <Widget>[
                    for (int i = 0; i < filtre.filtres.length; i++)
                      _filter(context, i, filtre),
                  ],
                ),
                DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(), color: Colors.blueGrey[200]),
                  child: OutlineButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'Afegeix',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    color: Colors.transparent,
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
      ),
    );
  }
}

Widget _filter(BuildContext context, int i, Filtrar filtre) {
  return Container(
    height: 40.0,
    margin: EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100), color: Colors.black),
    child: Row(
      mainAxisSize: MainAxisSize.min,
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

class Search extends SearchDelegate<String> {
//List<String> locs=[];

  final List<String> locs = [
    'FOOT, Terrassa',
    'ESEIAAT, Terrassa',
    'Camins, Barcelona',
    'FNB, Barcelona',
    "ETSEIB, Barcelona",
    "ESAB, Castelldefels",
    "EUNCET, Terrassa",
    "EAE, Barcelona",
    "CITM, Terrassa",
    "FME, Barcelona",
    "EPSEB, Barcelona",
    "EEBE, Barcelona",
    "ETSETB, Barcelona",
    "EPSEM, Manresa",
    "ESAB, Castelldefels",
    "EETAC, Castelldefels",
    "EPSEVG, Vilanova i la Geltrú",
    "FIB, Barcelona",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
         //final locs = Provider.of<LocsList>(context);

    final filtre = Provider.of<Filtrar>(context);
    final suggestionList = query.isEmpty
        ? locs
        : locs.where((p) => p.startsWith(query.toUpperCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          filtre.afegeixLoc(suggestionList[index]);
          close(context, null);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );

    /*
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
          bool repetit = false;
          locs.add(graus[0].loc);
          for (int i = 1; i < graus.length; i++) {
            for (int j = 0; j < i; j++) {
              if (graus[i].loc == graus[j].loc) repetit = true;
            }
            if (!repetit) locs.add(graus[i].loc);
          }

          return ListView.builder(
            itemExtent: 100,
            itemCount: locs.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                filtre.afegeixLoc(suggestionList[index]);
                close(context, null);
              },
              leading: Icon(Icons.location_city),
              title: RichText(
                text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );*/
  }
}
