import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static createUser(
      BuildContext context, String name, String email, String password) async {
    UserCredential userCredential;
    try {
      // create user
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Store User Data
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(userCredential.user!.uid)
          .set({
        'fullName': name,
        'email': email,
        'password': password,
        'userId': userCredential.user!.uid,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration Successful"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The account already exists for that email."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
