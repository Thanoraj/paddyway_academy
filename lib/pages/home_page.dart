import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/widgets/contact_us_button.dart';
import 'package:paddyway_academy/widgets/unit_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> _getLesson;
  @override
  initState() {
    //if (currentUser != null) _getLesson = Firestore.getLessons();
    super.initState();
  }

  List onGoingLessons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your ongoing classes"),
      ),
      body: currentUser != null
          ? ListView(
              children: [
                for (Map subject in currentUser!.allowedSubjects!)
                  const UnitCard(),
              ],
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

/*FutureBuilder(
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
            )*/
