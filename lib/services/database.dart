import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracker/model/userData_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore? _firebaseFirestore = FirebaseFirestore.instance;
  var uid = FirebaseAuth.instance.currentUser!.uid;
  // getting user name
  Stream<UserModel?> get name {
    return _firebaseFirestore!
        .collection("userData")
        .doc(uid)
        .snapshots()
        .map((event) => UserModel(name: event["fullName"]));
  }
}
