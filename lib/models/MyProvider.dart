import 'package:flutter/foundation.dart';
import 'package:graus_upc/screens/sign_in.dart';

class MyProvider with ChangeNotifier {
  bool check = false;

  void doit() {
    signInWithGoogle().whenComplete(() {
      check = true;
    });

    notifyListeners();
  }

  void dotrue() {
    check = true;

    notifyListeners();
  }

  void dofalse() {
    signOutGoogle();
    check = false;

    notifyListeners();
  }
}
