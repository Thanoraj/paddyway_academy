import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/long_video_card.dart';

class AllVideosPage extends StatelessWidget {
  const AllVideosPage({Key? key, required this.videos, required this.title})
      : super(key: key);
  final List videos;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return LongVideoCard(videoInfo: videos[index]);
          }),
    );
  }
}
