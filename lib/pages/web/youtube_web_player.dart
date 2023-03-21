import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/youtube_video.dart';
import '../../widgets/web/responsive_widget.dart';

class YoutubeWebPlayer extends StatefulWidget {
  const YoutubeWebPlayer({Key? key, this.videoModel}) : super(key: key);
  final YoutubeVideoModel? videoModel;

  @override
  _YoutubeWebPlayerState createState() => _YoutubeWebPlayerState();
}

class _YoutubeWebPlayerState extends State<YoutubeWebPlayer> {
  late YoutubePlayerController _controller;
  late String videoId;

  @override
  void initState() {
    super.initState();
    print("Hello world");
    videoId = "Skh_wTbopzk" /*widget.videoModel.id!*/;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: const YoutubePlayerParams(
        startAt: Duration(minutes: 0, seconds: 00),
        showControls: true,
        showFullscreenButton: true,
        showVideoAnnotations: false,
        playsInline: false,
        desktopMode: true,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
    _controller.hideTopMenu();
    _controller.hidePauseOverlay();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return IgnorePointer(
      child: YoutubePlayerControllerProvider(
        // Passing controller to widgets below.
        controller: _controller,
        child: ResponsiveWidget(
          largeScreen: Scaffold(
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const IgnorePointer(child: player),
                    GestureDetector(
                      child: Container(
                        color: const Color(0x88ffffff),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    print("hello");
                  },
                  child: const Text("Gdi chia fhivwhi cwvijd"),
                )
              ],
            ),
          ),
          mediumScreen: Scaffold(
            body: ListView(
              children: [
                YoutubePlayerControllerProvider(
                  // Provides controller to all the widget below it.
                  controller: _controller,
                  child: const YoutubePlayerIFrame(
                    aspectRatio: 16 / 9,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Hello world");
                  },
                  child: const Text(
                    "Hello world",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
