import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracker/model/userData_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static Future<UserModel?> getUserName() async {
    String? name = "";
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("user Name is ${documentSnapshot["fullName"]}");
        name = documentSnapshot["fullName"];
      }
    });
   
    return UserModel(name: name);
  }
}
