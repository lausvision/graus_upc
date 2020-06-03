import 'package:flutter/foundation.dart';
import 'package:graus_upc/models/User.dart';
import 'package:graus_upc/screens/sign_in.dart';

class UserAuthState with ChangeNotifier {
  User user;
  // String uidProvider;

  get check => user != null;

  void signIn([Function callback]) {
    signInWithGoogle().then((User user) {
      this.user = user;
      notifyListeners();
      if (callback != null) {
        callback();
      }
    });
  }

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void signOut() {
    signOutGoogle();
    user = null;
    notifyListeners();
  }
}
