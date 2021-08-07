import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  static Future<String?> getUserName() async {
    String name = '';
    await FirebaseFirestore.instance
        .collection("userData")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        print(element["fullName"]);
        name = element["fullName"];
      });
    });
    return name;
  }
}
