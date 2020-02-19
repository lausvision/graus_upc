import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _ProfileScreenState();

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
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
        // title: Text( 'Tu Perfil', style: TextStyle(color: Colors.teal), ),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
