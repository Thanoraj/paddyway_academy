import 'package:flutter/material.dart';
import 'package:paddyway_academy/models/youtube_video.dart';
import 'package:paddyway_academy/pages/youtube_video_player.dart';

class LongVideoCard extends StatelessWidget {
  const LongVideoCard({Key? key, required this.videoInfo}) : super(key: key);
  final YoutubeVideoModel videoInfo;
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
                    videoInfo.thumbnail!,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        videoInfo.title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            videoInfo.duration!,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          videoInfo.author!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
