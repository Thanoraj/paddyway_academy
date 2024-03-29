import 'package:flutter/material.dart';
import 'package:paddyway_academy/models/youtube_video.dart';
import 'package:paddyway_academy/pages/youtube_video_player.dart';

class YoutubeVideoCard extends StatelessWidget {
  const YoutubeVideoCard({Key? key, required this.videoData}) : super(key: key);
  final YoutubeVideoModel videoData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 150,
        width: 250,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    YoutubeVideoPlayer(videoDetail: videoData),
              ),
            );
          },
          child: Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 5,
            color: Colors.grey[700],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[700],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      videoData.thumbnail!,
                      width: 250,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "😟",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Error occurred!"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      videoData.title!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
