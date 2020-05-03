import 'package:flutter/material.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/screens/sign_in.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            WallpaperFoto(),
            LogOutClass(),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20),
              child: Text(
                email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FotoPerfil(),
            Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 180),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:250,left: 25),
              child: FlatButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  // createRecord();
                },
                child: Text(
                  "Llistat de Preferits",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ));
  }
}

class FotoPerfil extends StatelessWidget {
  const FotoPerfil({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
          radius: 65,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class WallpaperFoto extends StatelessWidget {
  const WallpaperFoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/marble_op.png"), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
    );
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
        padding: const EdgeInsets.only(top: 35.0, left: 320),
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
                  return ProfileScreen();
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
