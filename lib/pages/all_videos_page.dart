import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/youtube_video_player.dart';
import 'package:paddyway_academy/widgets/document_card.dart';
import 'package:paddyway_academy/widgets/long_video_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../models/document_model.dart';
import '../models/youtube_video.dart';
import '../theme_info.dart';
import 'home_page.dart';

class AllItemsPage extends StatefulWidget {
  const AllItemsPage(
      {Key? key, required this.title, this.type, required this.unit})
      : super(key: key);
  final String title;
  final String unit;
  final String? type;

  @override
  State<AllItemsPage> createState() => _AllItemsPageState();
}

class _AllItemsPageState extends State<AllItemsPage> {
  late Future<List> _getItemList;

  int cardWidth = 280;
  int imageHeight = 150;

  @override
  initState() {
    super.initState();
    _getItemList = getItemList();
  }

  List itemsList = [];

  Future<List> getItemList() async {
    itemsList = [];
    await FirebaseFirestore.instance
        .collection("lessons")
        .doc(widget.unit)
        .collection(widget.title)
        .doc(widget.type ?? "videos")
        .get()
        .then((value) {
      itemsList = value.data()![widget.type ?? 'videos'];
    }).catchError((e) {});

    return itemsList;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getItemList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return itemsList.isNotEmpty
                ? width < 600
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: itemsList.length,
                        itemBuilder: (context, index) {
                          return widget.type == "documents"
                              ? DocumentCard(document: itemsList[index])
                              : LongVideoCard(
                                  videoInfo: itemsList[index], index: index);
                        })
                    : GridView.count(
                        padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: (width -
                                    (width ~/ cardWidth).toInt() * cardWidth) /
                                ((width ~/ cardWidth).toInt() + 1)),
                        crossAxisCount: (width ~/ cardWidth).toInt(),
                        mainAxisSpacing: 20,
                        crossAxisSpacing:
                            (width - (width ~/ cardWidth).toInt() * cardWidth) /
                                ((width ~/ cardWidth).toInt() + 1),
                        children: [
                          for (int i = 0; i < itemsList.length; i++)
                            widget.type == "documents"
                                ? GestureDetector(
                                    onTap: () async {
                                      DocumentModel doc = DocumentModel();
                                      doc.lesson = selectedUnit!;
                                      doc.name = itemsList[i]['name'];
                                      doc.url = itemsList[i]['url'];
                                      doc.lesson = selectedUnit!;
                                      await launchUrl(
                                        Uri.parse(doc.url),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    },
                                    child: Material(
                                      color: ThemeInfo.cardColor,
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            width: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.0, horizontal: 8),
                                            child: Image.asset(
                                              pdfIcon,
                                              width: 280,
                                              height: 150,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              itemsList[i]['name'],
                                              style: TextStyle(
                                                  color: ThemeInfo
                                                      .contrastPrimaryTextColor),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ThemeInfo.cardColor,
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.network(
                                              itemsList[i]['thumbnails'],
                                              width: cardWidth.toDouble(),
                                              height: 150,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "😟",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: ThemeInfo
                                                                .primaryTextColor),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Error occurred!",
                                                        style: TextStyle(
                                                          color: ThemeInfo
                                                              .primaryTextColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    itemsList[i]['videoTitle'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ThemeInfo
                                                          .contrastPrimaryTextColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.timer_outlined,
                                                        size: 15,
                                                        color: ThemeInfo
                                                            .contrastPrimaryTextColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        itemsList[i]
                                                            ['duration'],
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: ThemeInfo
                                                              .contrastPrimaryTextColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    itemsList[i]['videoAuthor'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: ThemeInfo
                                                          .contrastPrimaryTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      YoutubeVideoModel videoModel =
                                          YoutubeVideoModel();
                                      videoModel.title =
                                          itemsList[i]['videoTitle'];
                                      videoModel.author =
                                          itemsList[i]['videoAuthor'];
                                      videoModel.duration =
                                          itemsList[i]['duration'];
                                      videoModel.thumbnail =
                                          itemsList[i]['thumbnails'];
                                      videoModel.description =
                                          itemsList[i]['description'];
                                      videoModel.id = itemsList[i]['id'];
                                      if (kIsWeb) {
                                        await FirebaseFirestore.instance
                                            .collection("AccessKey")
                                            .add({"access": true}).then(
                                                (value) {
                                          String videoURL =
                                              "https://paddyway-academy-player.web.app/${value.id}_${selectedUnit}_${selectedSection}_$i";
                                          print(videoURL);
                                          launchUrl(
                                            Uri.parse(
                                              videoURL,
                                            ),
                                          );
                                        });
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => /*YoutubePlayerDemoApp()*/
                                                    YoutubeVideoPlayer(
                                              videoDetail: videoModel,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                        ],
                      )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "No ${widget.type ?? 'videos'} available in this section now",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
