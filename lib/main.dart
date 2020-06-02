import 'package:flutter/material.dart';
//import 'package:graus_upc/scraper/scraper.dart';

import 'package:graus_upc/models/UserAuthState.dart';
import 'package:graus_upc/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Filtrar>(
      create: (context) => Filtrar(),
      child: ChangeNotifierProvider<UserAuthState>(
        create: (context) => UserAuthState(),
        child: MaterialApp(
          home: Scaffold(body: HomeScreen()),
        ),
      ),
    );
  }
}
/*
void main(){
  runApp(MaterialApp(home: Scraper(),));
}*/
