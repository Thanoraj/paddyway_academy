import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paddyway_academy/pages/landing_page.dart';

import '../../models/document_model.dart';
import '../../models/user_model.dart';
import '../../models/youtube_video.dart';

class Firestore {
  static Future<bool?> checkValidity(String userID) async {
    bool? validity;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .get()
        .then((value) {
      if (value.data() != null) {
        validity = value.data()!['isValid'];
      }
    });
    return validity;
  }

  static Future updateValidity(String userID) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .update({"isValid": false});
  }

  static fetchUserData(String userId) async {
    if (userId != "") {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get()
          .then((value) {
        if (value.data() != null) {
          currentUser = UserModel();
          currentUser!.id = value.data()!['id'];
          currentUser!.name = value.data()!['name'];
          currentUser!.year = value.data()!['class'];
          currentUser!.allowedSubjects = value.data()!['allowedSubjects'];
        }
      }).catchError((e) {});
    }
  }

  static uploadVideoData(Map data) async {
    data.forEach((key, value) async {
      await FirebaseFirestore.instance.collection("lessons").doc(key).set({
        'title': value['title'],
        'videos': value['videos'],
      }).catchError((e) {});
    });
  }

  static Future saveFalseAttempt(String userID) async {
    String time = DateTime.now().toString();
    await FirebaseFirestore.instance
        .collection("False attempts")
        .doc(time)
        .set({'id': userID, 'time': time});
  }

  static Future<List> getLessons() async {
    List onGoingLessons = [];
    for (String subjectId in currentUser!.allowedSubjects!) {
      await FirebaseFirestore.instance
          .collection("lessons")
          .doc(subjectId)
          .get()
          .then((value) {
        List videos = [];
        List documents = [];
        for (Map videoInfo in value.data()!["videos"]) {
          YoutubeVideoModel video = YoutubeVideoModel();
          video.id = videoInfo['id'];
          video.title = videoInfo['videoTitle'];
          video.duration = videoInfo['duration'];
          video.description = videoInfo['description'];
          video.author = videoInfo['videoAuthor'];
          video.thumbnail = videoInfo['thumbnails'];
          videos.add(video);
        }
        for (Map document in value.data()!['documents']) {
          DocumentModel doc = DocumentModel();
          doc.name = document['name'];
          doc.url = document['url'];
          doc.lesson = subjectId;
          documents.add(doc);
        }
        onGoingLessons.add({
          'title': value.data()!['title'],
          'videos': videos,
          'documents': documents,
        });
      });
    }
    return onGoingLessons;
  }
}
