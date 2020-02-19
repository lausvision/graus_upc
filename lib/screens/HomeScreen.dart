import 'package:flutter/material.dart';

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
            builder: (context) => HomeScreen(),
          ),
        );
        //print('Geohash');
        // print(Geohash.encode(my_geohash.latitude, my_geohash.longitude).substring(0, 7));
        //print('Hola');
      
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
    setState(() {
      ///////// Cuando tengamos las otras dos páginas, establecemos aquí las rutas
      _selectedIndex = index;
    });  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedLabelStyle: TextStyle(fontSize: 11, color: Colors.red),
        unselectedIconTheme: IconThemeData(size: 12, color: Colors.grey[600]),
        backgroundColor: Colors.grey[200],
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
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Text( 'Tu Perfil', style: TextStyle(color: Colors.teal), ),
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          tooltip: 'Log out',
          color: Colors.teal,
          onPressed: () {
          
          },
        ),
        actions: <Widget>[],
      ),
    );
  }
}
