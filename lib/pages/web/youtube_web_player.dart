import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../models/youtube_video.dart';

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
    videoId =
        "k5T7HrpKPa4" /*widget.videoModel.id!https://youtu.be/k5T7HrpKPa4*/;
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
    return Column(
      children: [
        Stack(
          //fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const SizedBox(height: 100, child: Text("Youtube player")),
            YoutubePlayerControllerProvider(
              controller: _controller,
              child: player,
            ),
          ],
        ),
      ],
    );
  }
}
