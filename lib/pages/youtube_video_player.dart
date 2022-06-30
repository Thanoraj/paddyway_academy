import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paddyway_academy/models/youtube_video.dart';
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

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
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
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
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
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
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
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              title: Text(widget.videoDetail.title!),
            ),
            body: Material(
              child: SizedBox(
                //color: kBodyFull,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Column(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: player),
                      Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.fromLTRB(24, 10, 8, 8.0),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: 4,
                            //         height: 30,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(500),
                            //         ),
                            //         child: const Text(""),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: SizedBox(
                            //           width: MediaQuery.of(context).size.width *
                            //               0.8,
                            //           child: Text(
                            //             widget.videoDetail.title!,
                            //             style: const TextStyle(
                            //                 fontFamily: 'Red Hat Display',
                            //                 fontSize: 24),
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 16.0),
                            //   child: Row(
                            //     children: [
                            //       const Spacer(),
                            //       const Icon(
                            //         Icons.timer_outlined,
                            //       ),
                            //       const SizedBox(
                            //         width: 5,
                            //       ),
                            //       Text(
                            //         widget.videoDetail.duration!,
                            //         style: const TextStyle(
                            //             fontFamily: 'Red Hat Display',
                            //             fontSize: 14),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                widget.videoDetail.author!,
                                style: const TextStyle(
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  widget.videoDetail.description!,
                                  style: const TextStyle(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 16),
                                ))
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
        //WaterMarker(loggedInUser: loggedInUser),
      ]),
    );
  }
}
