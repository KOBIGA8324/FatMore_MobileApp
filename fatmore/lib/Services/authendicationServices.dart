import 'package:fatmore/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<User?> CreateNewUSer(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Success");
      return user;
    } else {
      print("faild");
      return user;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<User?> LogIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Success");
      return user;
    } else {
      print("faild");
      return user;
    }
  } catch (e) {
    if (e.toString() == 'user-not-found') {
      print("No user found for that email");
    } else if (e.toString() == 'wrong-password') {
      print("Wrong password Provided");
    }
  }
}

Future Logout(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  } catch (e) {
    print(e.toString());
  }
}
