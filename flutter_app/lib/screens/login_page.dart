import 'package:flutter/material.dart';
import 'package:graus_upc/models/UserAuthState.dart';
import 'package:graus_upc/screens/LoginPageB.dart';

import 'package:graus_upc/screens/ProfileScreen.dart';
import 'package:graus_upc/screens/registration_page.dart';

import 'package:provider/provider.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/marble_op.png"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/logo.png"), height: 180.0),
              SizedBox(height: 50),
              _signInButton(),
              SizedBox(height: 25),
              Text("No tens compte google?",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.white,
                textColor: Colors.black,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10, left: 100, right: 100),
                splashColor: Colors.blue[100],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return LoginPageB(); 
                    },
                  ));
                },
                child: Text(
                  "LOG IN",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.black,
                textColor: Colors.white,
                disabledTextColor: Colors.black,
                padding:
                    EdgeInsets.only(top: 10.0, bottom: 10, left: 88, right: 88),
                splashColor: Colors.blueGrey,
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RegistrationPage(); 
                    },
                  ));
                },
                child: Text(
                  "REGISTER",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    final log = Provider.of<UserAuthState>(context);
    return OutlineButton(
      splashColor: Colors.grey[50],
      onPressed: () {
        log.signIn(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfileScreen();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black, width: 2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
