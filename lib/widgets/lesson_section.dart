import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/youtube_video_card.dart';

class LessonSection extends StatelessWidget {
  const LessonSection({Key? key, required this.lesson}) : super(key: key);
  final Map lesson;

  @override
  Widget build(BuildContext context) {
    print(lesson);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              lesson['title'],
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SizedBox(
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lesson['videos'].length,
                itemBuilder: (context, index) {
                  return YoutubeVideoCard(videoData: lesson['videos'][index]);
                }),
          ),
        )
      ],
    );
  }
}
