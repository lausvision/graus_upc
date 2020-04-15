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
    return Scaffold(
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
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
             Container(
               decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/marble.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
            ),
            LogOutClass(),
            Container(
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
                      name,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
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
          ],
        ));
  }
}

class LogOutClass extends StatelessWidget {
  const LogOutClass({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 300),
        child: Column(
          children: <Widget>[
            IconButton(
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
            Text(
              'Sortir',
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
