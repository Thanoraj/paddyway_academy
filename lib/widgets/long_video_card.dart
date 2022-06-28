import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/youtube_video_player.dart';

class LongVideoCard extends StatelessWidget {
  const LongVideoCard({Key? key, required this.videoInfo}) : super(key: key);
  final Map videoInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YoutubeVideoPlayer(
                videoDetail: videoInfo,
              ),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
          elevation: 5,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    videoInfo['thumbnails'],
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      videoInfo['videoTitle'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          videoInfo['duration'].split('.')[0],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
