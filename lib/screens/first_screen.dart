import 'package:flutter/material.dart';
//import 'package:graus_upc/screens/EditProfileScreen.dart';
import 'package:graus_upc/screens/login_page.dart';
import 'package:graus_upc/screens/sign_in.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
    return Stack(
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/marble.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
            ),
            Scaffold(
        backgroundColor: Colors.blue[100],
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
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Sign out',
            color: Colors.black,
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName('/'));
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                tooltip: 'Edit profile',
                color: Colors.black,
                onPressed: () {
                  /*
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        userId,
                        Objeto(
                          'New name',
                          'New username',
                          'New email',
                          '*****',
                          '*****',
                        ),
                      ),
                    ),
                  );*/
                })
          ],
        ),
        body: Container(
          /* decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[100], Colors.white],
            ),
          ),*/
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                  radius: 65,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 40),
                Text(
                  'NAME',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'EMAIL',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  email,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),

          ] 
    );
  }
}
