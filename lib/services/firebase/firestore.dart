import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paddyway_academy/pages/landing_page.dart';

import '../../models/document_model.dart';
import '../../models/user.dart';
import '../../models/youtube_video.dart';

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
