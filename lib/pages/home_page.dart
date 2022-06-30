import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/models/document_model.dart';
import 'package:paddyway_academy/models/youtube_video.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/widgets/contact_us_button.dart';

import '../widgets/lesson_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future _getLesson;
  @override
  initState() {
    if (currentUser != null) _getLesson = getLessons();
    super.initState();
  }

  List onGoingLessons = [];

  getLessons() async {
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
    return onGoingLessons.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your ongoing classes"),
      ),
      body: currentUser != null
          ? FutureBuilder(
              future: _getLesson,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data == true) {
                  return ListView.builder(
                      padding: const EdgeInsets.only(top: 30),
                      itemCount: onGoingLessons.length,
                      itemBuilder: (context, index) {
                        return LessonSection(lesson: onGoingLessons[index]);
                      });
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                      child: Text(
                    "No lessons available",
                    style: TextStyle(fontSize: 20),
                  ));
                }
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "There are no lessons available for you,\n for more information",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                ContactUsButton(),
              ],
            ),
    );
  }
}
