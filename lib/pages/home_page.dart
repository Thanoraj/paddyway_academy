import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:paddyway_academy/widgets/contact_us_button.dart';
import 'package:paddyway_academy/widgets/unit_card.dart';
import 'package:paddyway_academy/widgets/youtube_channel_card.dart';

String? selectedUnit;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentUser != null
          ? SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Text(
                      hiText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: ThemeInfo.secondaryTextColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            currentTaskText,
                            style: TextStyle(
                              color: ThemeInfo.primaryTextColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        for (Map subject in currentUser!.allowedSubjects!)
                          UnitCard(
                            unit: subject,
                          ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: YoutubeChannelCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  invalidLoginText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ContactUsButton(),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: YoutubeChannelCard(),
                ),
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
