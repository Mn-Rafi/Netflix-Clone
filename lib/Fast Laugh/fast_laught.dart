import 'package:flutter/material.dart';
import 'package:netflix_ui/Fast%20Laugh/singlepage.dart';
import 'package:netflix_ui/New%20and%20hot/newandhotutilities2.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          FastLaughSinglePage(
              url:
                  'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
              imageUrl: comImg[0].url),
          FastLaughSinglePage(
              url:
                  'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4',
              imageUrl: comImg[1].url),
          FastLaughSinglePage(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              imageUrl: comImg[0].url),
          FastLaughSinglePage(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              imageUrl: comImg[1].url),
          FastLaughSinglePage(
              url:
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
              imageUrl: comImg[0].url),
          FastLaughSinglePage(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              imageUrl: comImg[1].url),
        ],
      ),
    );
  }
}
