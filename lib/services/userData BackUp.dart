import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {
  String _name = '';
  String get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  UserData() {
    getUserName();
  }
  Future<void> getUserName() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("user Name is ${documentSnapshot["fullName"]}");
        setName(documentSnapshot["fullName"]);
      }
    });
  }
}
