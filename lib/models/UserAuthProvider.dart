import 'package:flutter/foundation.dart';
import 'package:graus_upc/screens/sign_in.dart';

class UserAuthProvider with ChangeNotifier {
  bool check = false;
  String uidProvider;

  void signIn() {
    signInWithGoogle().whenComplete(() {
      check = true;
      uidProvider = uid;
    });

    notifyListeners();
  }

  void dochecktrue(uid) {
    check = true;
    uidProvider = uid;
    notifyListeners();
  }

  void signOut() {
    signOutGoogle();
    check = false;
    uidProvider=null;

    notifyListeners();
  }
}
