import 'package:flutter/material.dart';
import 'package:graus_upc/data/mostrallista.dart';
import 'package:graus_upc/screens/InfoScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();
  //List<dynamic> llista = MostraLlista();

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
        backgroundColor: Colors.grey[300],
      ),
      body: Llista(),
      /*body: ListView.builder(
        itemCount: llista.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: ListTile(
            title: Text(
              llista[index].nom,
            ),
            subtitle: Row(
              children: <Widget>[
                Text(llista[index].localitzacio),
                Expanded(child: Container()),
                Text(llista[index].modalitat),
              ],
            ),
          ),
        ),
      )*/
    );
  }
}
