import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
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
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text(
              youtubeChannelText,
              style: TextStyle(
                color: ThemeInfo.contrastPrimaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: ThemeInfo.youtubeChannelBgColor),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeInfo.primaryLightColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        channelLogo,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 190,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          channelName,
                          style: TextStyle(
                              color: ThemeInfo.contrastSecondaryTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                              mode: LaunchMode.externalApplication);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ThemeInfo.channelWatchVideoButtonColor,
                            shape: ThemeInfo.channelButtonBorder),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 270,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                channelButtonText,
                                style: const TextStyle(fontSize: 18),
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
    );
  }
}
