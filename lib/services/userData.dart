import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//TODO: Use try catch bloc for safety
// Replace QuerySnapshot to DocumentSnapshot...follow flutterfire webSite

class UserData with ChangeNotifier{
  static Future<String?> getUserName() async {
    String name = '';
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
          if(documentSnapshot.exists){
            print("user Name is ${documentSnapshot["fullName"]}");
            name = documentSnapshot["fullName"];
            
          }
        });
    return name;
  }
}
