import 'package:flutter/material.dart';
//import 'package:graus_upc/screens/AwaitScreen.dart';
import 'package:graus_upc/screens/HomeScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Meter un StreamBuilder con FirebaseAuth.instance.onAuthStateChanged (+ Provider)
    //       según (https://github.com/minidosis/flutter_firebase_auth/blob/master/lib/login_flow/auth_state_switch.dart)
    // TODO: Mirar https://youtu.be/j-ZKEbGFYXQ
    return MaterialApp(
      home: Scaffold(body: HomeScreen()/*AwaitScreen()*/),
    );
  }
}
