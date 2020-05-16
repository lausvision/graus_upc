import 'package:flutter/material.dart';
//import 'package:graus_upc/models/UserAuthProvider.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Meter un StreamBuilder con FirebaseAuth.instance.onAuthStateChanged (+ Provider)
    //       según (https://github.com/minidosis/flutter_firebase_auth/blob/master/lib/login_flow/auth_state_switch.dart)
    // Mirar https://youtu.be/j-ZKEbGFYXQ
    /*return ChangeNotifierProvider<UserAuthProvider>(
      create: (context) => UserAuthProvider(),
      child: MaterialApp(
        home: Scaffold(body: HomeScreen()),
      ),
    );*/
     return ChangeNotifierProvider<Filtrar>(
      create: (context) => Filtrar(),
      child: MaterialApp(
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}
