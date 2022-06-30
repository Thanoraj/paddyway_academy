import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paddyway_academy/pages/landing_page.dart';

import '../../models/user.dart';

class Firestore {
  static validateUser(String userId) async {
    if (userId != "") {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get()
          .then((value) {
        print(value.data());
        if (value.data() != null) {
          currentUser = User();
          currentUser!.id = value.data()!['id'];
          currentUser!.name = value.data()!['name'];
          currentUser!.year = value.data()!['class'];
          currentUser!.allowedSubjects = value.data()!['allowedSubjects'];
        }
      }).catchError((e) {});
    }
  }

  static uploadVideoData(Map data) async {
    int i = 0;
    data.forEach((key, value) async {
      // print(key);
      // print(value['title']);
      // return;
      await FirebaseFirestore.instance.collection("lessons").doc(key).set({
        'title': value['title'],
        'videos': value['videos'],
      }).catchError((e) {
        print(e);
      });
      print(i + 1);
    });
    print("completed");
  }
}
