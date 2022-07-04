import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:paddyway_academy/models/youtube_video.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({Key? key, required this.videoDetail})
      : super(key: key);
  final YoutubeVideoModel videoDetail;
  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late String videoId;
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  bool _isPlayerReady = false;

  @override
  void initState() {
    toggleScreenSecurity(true);
    videoId = YoutubePlayer.convertUrlToId(widget.videoDetail.id!)!;
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void toggleScreenSecurity(bool secure) async {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        if (secure) {
          await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        } else {
          await FlutterWindowManager.clearFlags(
              FlutterWindowManager.FLAG_SECURE);
        }
      }
    }
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    toggleScreenSecurity(false);
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        YoutubePlayerBuilder(
          onExitFullScreen: () {
            SystemChrome.setPreferredOrientations(
              DeviceOrientation.values,
            );
          },
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: ThemeInfo.primaryLightColor,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          builder: (context, player) => Scaffold(
            appBar: AppBar(
              title: Text(
                widget.videoDetail.title!,
              ),
            ),
            body: Material(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: player,
                      ),
                      Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Text(
                                widget.videoDetail.author!,
                                style: const TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                widget.videoDetail.description!,
                                style: const TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
