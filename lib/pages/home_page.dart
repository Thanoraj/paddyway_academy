import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/pages/section_page.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:paddyway_academy/widgets/contact_us_button.dart';
import 'package:paddyway_academy/widgets/unit_card.dart';
import 'package:paddyway_academy/widgets/youtube_channel_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/my_flat_button.dart';

String? selectedUnit;
String? selectedSection;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double cardWidth = 280;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                    child: width < 750
                        ? ListView(
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
                          )
                        : GridView.count(
                            padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: (width -
                                        (width ~/ cardWidth).toInt() *
                                            cardWidth) /
                                    ((width ~/ cardWidth).toInt() + 1)),
                            crossAxisCount: (width ~/ cardWidth).toInt(),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: (width -
                                    (width ~/ cardWidth).toInt() * cardWidth) /
                                ((width ~/ cardWidth).toInt() + 1),
                            children: [
                              for (Map subject in currentUser!.allowedSubjects!)
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                    color: ThemeInfo.cardColor,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          subject['unit'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            color: ThemeInfo
                                                .contrastPrimaryTextColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: MyFlatButton(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          onTap: () async {
                                            selectedUnit = subject['unit'];
                                            List sections = [];
                                            await FirebaseFirestore.instance
                                                .collection("lessons")
                                                .doc(subject['unit'])
                                                .get()
                                                .then((value) {
                                              sections = value['sections'];
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SectionsPage(
                                                  sections: sections,
                                                  unit: subject["unit"],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                sectionCardButtonText,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ThemeInfo.cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      child: Text(
                                        youtubeChannelText,
                                        style: TextStyle(
                                          color: ThemeInfo
                                              .contrastPrimaryTextColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              ThemeInfo.youtubeChannelBgColor),
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Column(
                                        children: [
                                          Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: ThemeInfo.primaryLightColor,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.asset(
                                                  channelLogo,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    190,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    channelName,
                                                    style: TextStyle(
                                                        color: ThemeInfo
                                                            .contrastSecondaryTextColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    launchUrl(
                                                        Uri.parse(
                                                          channelUrl,
                                                        ),
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary: ThemeInfo
                                                          .channelWatchVideoButtonColor,
                                                      shape: ThemeInfo
                                                          .channelButtonBorder),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15,
                                                        vertical: 10),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              270,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          channelButtonText,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
