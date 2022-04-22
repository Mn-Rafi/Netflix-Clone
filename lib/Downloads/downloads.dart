import 'package:flutter/material.dart';
import 'package:netflix_ui/API/apis.dart';
import 'package:netflix_ui/API/tmdb_links.dart';
import 'package:netflix_ui/Downloads/downloads_utilities.dart';
import 'package:shimmer/shimmer.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Downloads',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.cast,
                      size: 25,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        "assets/profile.png",
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Row(
            children: const [
              SizedBox(),
              Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              SizedBox(),
              Text(
                ' Smart Downloads',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Introducing Downloads for You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                  width: 300,
                  child: Text(
                    "We'll download a personalized selection of movies and shows for you, so there is always something to watch on your device",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    textAlign: TextAlign.center,
                  )),
              FutureBuilder(
                  future: HttpServices().getTrending(TMDB.trending),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 400,
                                height: 400,
                                child: CustomPaint(
                                  painter: OpenPainter(),
                                ),
                              ),
                              CustomAngledImage(
                                angle: 25,
                                url: snapshot.data[0].image,
                                margin:
                                    const EdgeInsets.only(left: 180, top: 30),
                              ),
                              CustomAngledImage(
                                angle: -25,
                                url: snapshot.data[1].image,
                                margin:
                                    const EdgeInsets.only(right: 170, top: 30),
                              ),
                              CustomAngledImage(
                                angle: 0,
                                url: snapshot.data[2].image,
                                margin:
                                    const EdgeInsets.only(top: 50, left: 10),
                              ),
                            ],
                          )
                        : Shimmer.fromColors(
                            highlightColor: Colors.grey,
                            baseColor: const Color.fromARGB(255, 51, 51, 51),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 400,
                                  height: 400,
                                  child: CustomPaint(
                                    painter: OpenPainter(),
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
            ],
          ),
          ElevatedButtonSetUP(
            onpressed: () {},
          ),
          const ElevatedButtonDownload(),
        ],
      ),
    );
  }
}
