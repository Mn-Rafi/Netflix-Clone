import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

class FastLaughSinglePage extends StatefulWidget {
  final String url;
  final String imageUrl;
  const FastLaughSinglePage({
    Key? key,
    required this.url,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<FastLaughSinglePage> createState() => _FastLaughSinglePageState();
}

class _FastLaughSinglePageState extends State<FastLaughSinglePage> {
  VideoPlayerController? _controller;
  Icon playIcon = const Icon(
    Icons.pause,
    color: Colors.white,
    size: 32,
  );

  Icon volumeIcon = const Icon(
    FeatherIcons.volume1,
    color: Colors.white,
    size: 32,
  );

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _controller!.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      _controller!.play().then((value) => _controller!.setLooping(true));
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : Container(
                color: Colors.black,
                child: const Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()))),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 60),
          child: SizedBox(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: Image.network(widget.imageUrl).image,
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.emoji_emotions,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      "LOL",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      "My List",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (playIcon.icon == Icons.pause) {
                            _controller!.pause();
                            playIcon = const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 32,
                            );
                          } else {
                            _controller!.play();
                            playIcon = const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 32,
                            );
                          }
                        });
                      },
                      child: playIcon,
                    ),
                    const Text(
                      "Play",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 65),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (volumeIcon.icon == FeatherIcons.volumeX) {
                    _controller!.setVolume(1);
                    volumeIcon = const Icon(
                      FeatherIcons.volume1,
                      color: Colors.white,
                      size: 32,
                    );
                  } else {
                    _controller!.setVolume(0);
                    volumeIcon = const Icon(
                      FeatherIcons.volumeX,
                      color: Colors.white,
                      size: 32,
                    );
                  }
                });
              },
              child: volumeIcon),
        ),
      )
    ]);
  }
}
