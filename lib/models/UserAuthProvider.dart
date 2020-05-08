import 'package:flutter/foundation.dart';
import 'package:graus_upc/screens/sign_in.dart';

class UserAuthProvider with ChangeNotifier {
  bool check = false;
  String uidProvider;


  void doit() {
    signInWithGoogle().whenComplete(() {
      check = true;
      uidProvider= uid; 
      
    });

    notifyListeners();
  }

  void dotrue() {
    check = true;

    notifyListeners();
  }

  void signOut() {
    signOutGoogle();
    check = false;

    notifyListeners();
  }
}
