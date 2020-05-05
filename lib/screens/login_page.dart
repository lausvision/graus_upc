import 'package:flutter/material.dart';
import 'package:graus_upc/models/MyProvider.dart';
import 'package:graus_upc/screens/ProfileScreen.dart';
//import 'package:graus_upc/models/createUserCollection.dart';
import 'package:graus_upc/screens/sign_in.dart';
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    
    final log = Provider.of<MyProvider>(context);
    return OutlineButton(
      splashColor: Colors.grey[50],
       onPressed: () {
         
        signInWithGoogle().whenComplete(() {
          log.dotrue();
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
      borderSide: BorderSide(color: Colors.black,width: 2),
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
