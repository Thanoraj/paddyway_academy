import 'package:flutter/material.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeChannelCard extends StatelessWidget {
  const YoutubeChannelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeInfo.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Watch free videos in our youtube channel",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      color: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/channel_logo.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    const Text(
                      "Paddyway Academy",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          launchUrl(
                              Uri.parse(
                                  "https://youtube.com/c/paddywayacademy"),
                              mode: LaunchMode.externalApplication);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffff3f3f),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "Watch videos",
                            style: TextStyle(fontSize: 18),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
