import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graus_upc/applets/subprogramas.dart';

import 'package:graus_upc/models/Grau.dart';

import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  

  

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
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              tooltip: 'Filtros',
              color: Colors.black,
              highlightColor: Colors.pink[150],
              onPressed: () {
              
              })
          ],
        ),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection('Graus')
              .orderBy('nom', descending:true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            QuerySnapshot data = snapshot.data;
            
            List<DocumentSnapshot> docs = data.documents;
            
            List<Grau> llistaDeGraus = [];
            llistaDeGraus=loadData(docs);
            

          
           
            return Scrollbar(
              child: ListView.builder(
                itemCount: llistaDeGraus.length,
                reverse: false,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        title: Text(
                        llistaDeGraus[index].nom
                        ),
                        dense: true,
                        //trailing: Text(trendingValoraciones[index].toString() + ' valoraciones'),
                        onLongPress: () {
                     
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
