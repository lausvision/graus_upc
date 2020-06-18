import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graus_upc/models/User.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

final databaseReference = Firestore.instance;

void createRecord(String uid) async {
  try {
    await databaseReference
        .collection("Users")
        .document(uid)
        .updateData({'preferits': FieldValue.arrayUnion([])});
  } on PlatformException catch (e) {
    await databaseReference
        .collection("Users")
        .document(uid)
        .setData({'preferits': FieldValue.arrayUnion([])});
  }
}

Future<User> signInWithGoogle() async {
  GoogleSignInAccount googleSignInAccount;
  try {
    googleSignInAccount = await googleSignIn.signIn();
  } on PlatformException catch (e) {
    print("PlatformException Error: ${e.toString()}");
    return null;
  }
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);

  final myuser = User(
    user.uid,
    user.displayName,
    user.email,
    user.photoUrl,
  );

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  createRecord(myuser.uid);

  return myuser;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
