import 'package:flutter/material.dart';

import '../temp_databaseStr.dart';
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
    _getLesson = getLessons();
    super.initState();
  }

  List onGoingLessons = [];

  getLessons() async {
    onGoingLessons = [];
    List allowedSubjects = user["123456"]['allowedSubjects'];
    for (String subjectId in allowedSubjects) {
      onGoingLessons.add(lessons[subjectId]);
    }
    return onGoingLessons.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your ongoing classes"),
      ),
      body: FutureBuilder(
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
          } else {
            return Center(
                child: const Text(
              "No lessons available",
              style: TextStyle(fontSize: 20),
            ));
          }
        },
      ),
    );
  }
}
