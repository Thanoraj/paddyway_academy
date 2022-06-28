import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/all_videos_page.dart';
import 'package:paddyway_academy/widgets/youtube_video_card.dart';

class LessonSection extends StatelessWidget {
  const LessonSection({Key? key, required this.lesson}) : super(key: key);
  final Map lesson;

  @override
  Widget build(BuildContext context) {
    print(lesson);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            children: [
              const Text(
                "Videos",
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllVideosPage(
                              videos: lesson['videos'],
                              title: lesson['title'])));
                },
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lesson['videos'].length,
                //lesson['videos'].length > 5 ? 5 : lesson['videos'].length,
                itemBuilder: (context, index) {
                  return YoutubeVideoCard(videoData: lesson['videos'][index]);
                }),
          ),
        )
      ],
    );
  }
}
