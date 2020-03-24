import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:graus_upc/data/mostrallista.dart';
import 'package:graus_upc/data/busqueda.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  var result = [];
  var temp = [];

  initiateSearch(val) {
    if (val.length == 0) {
      setState(() {
        result = [];
        temp = [];
      });
    }
    var capital = val.substring(0, 1).toUpperCase() + val.substring(1);
    if (result.length == 0 && val.length == 0) {
      Busqueda().tots().then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          result.add(docs.documents[i].data);
        }
      });
    } else if (result.length == 0 && val.length == 1) {
      Busqueda().nombre(val).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          temp.add(docs.documents[i].data);
        }
      });
    } else {
      temp = [];
      result.forEach((element) {
        if (element['nom'].startsWith(capital)) {
          setState(() {
            temp.add(element);
          });
        }
      });
    }
  }

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

  final db = Firestore.instance;

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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _bar() : _card(index - 1);
          },
          itemCount: result.length + 1,
        ));
  }

  _bar() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        onChanged: (value) {
          initiateSearch(value);
        },
        decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: Icon(Icons.menu),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }

  _card(document) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      document['nom'],
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Text(
                        document['nota'].toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      document['loc'],
                      style: TextStyle(fontSize: 14),
                    ),
                    Expanded(child: Container()),
                    Container(
                      child: Text(
                        document['branca'],
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
