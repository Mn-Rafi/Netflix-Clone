import 'package:flutter/material.dart';
import 'package:netflix_ui/API/apis.dart';
import 'package:netflix_ui/API/tmdb_links.dart';
import 'package:netflix_ui/Home%20Page/categories.dart';
import 'package:netflix_ui/Home%20Page/home_utilities.dart';
import 'package:shimmer/shimmer.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: change
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "TV Shows",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                change = false;
                              });
                            },
                            child: const Text(
                              "Movies",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) =>
                                          CategoriesPage(isCategory: true));
                                },
                                child: const Text(
                                  "Categories",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                change = true;
                              });
                            },
                            child: const Text(
                              "Movies",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) =>
                                          CategoriesPage(isCategory: false));
                                },
                                child: const Text(
                                  "All Categories",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
              ),
              preferredSize: const Size.fromHeight(30),
            ),
            floating: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 40,
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
          FutureBuilder(
              future: HttpServices().getTrending(TMDB.trending),
              builder: (context, AsyncSnapshot snapshot) {
                return SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Container(
                      transform: Matrix4.translationValues(0.0, -128.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 550,
                            child: Stack(
                              children: [
                                snapshot.hasData
                                    ? Container(
                                        height: 550,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            image: DecorationImage(
                                                image: Image.network(TMDB
                                                            .imageId +
                                                        snapshot.data[4].image)
                                                    .image,
                                                fit: BoxFit.cover)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          height: 550,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                          ),
                                        ),
                                      ),
                                Container(
                                  // height: 350.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.1),
                                        Colors.black.withOpacity(0.8),
                                      ],
                                      stops: const [0.0, 1.0],
                                    ),
                                  ),
                                ),
                                SafeArea(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Drama  •  Soaps  •  Suspensful  •  Thriller  •  Entertainer  •  Romantic",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: const [
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                                Text(
                                                  "My List",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.white,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  Text("Play"),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: const [
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                                Text(
                                                  "Info",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 15, left: 15, top: 15),
                                child: Text(
                                  "Continue Watching for Rafi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: snapshot.hasData
                                    ? Row(
                                        children: [
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[0].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[1].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[2].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[3].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[4].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[5].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[6].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[7].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[8].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[9].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[10].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[11].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[12].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[13].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[14].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[15].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[16].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[17].image,
                                              "S1:E5"),
                                          playList(
                                              TMDB.imageId +
                                                  snapshot.data[18].image,
                                              "S1:E5"),
                                        ],
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Row(
                                          children: [
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  "Popular on Netflix",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: snapshot.hasData
                                    ? Row(
                                        children: [
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[15].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[14].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[13].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[12].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[11].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[10].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[9].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[8].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[7].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[6].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[5].image,
                                          ),
                                          popularOnNetflix(
                                            TMDB.imageId +
                                                snapshot.data[4].image,
                                          ),
                                        ],
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Row(
                                          children: [
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  "Trending Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: snapshot.hasData
                                    ? Row(
                                        children: [
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[5].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[6].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[7].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[8].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[9].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[11].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[12].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[13].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[14].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[13].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[15].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[17].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[1].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[5].image,
                                          ),
                                          trendingList(
                                            TMDB.imageId +
                                                snapshot.data[3].image,
                                          ),
                                        ],
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Row(
                                          children: [
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  "Top 10 in India Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: snapshot.hasData
                                    ? Row(
                                        children: [
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[17].image,
                                            index: 1,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[15].image,
                                            index: 2,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[12].image,
                                            index: 3,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[9].image,
                                            index: 4,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[8].image,
                                            index: 5,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[6].image,
                                            index: 6,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[4].image,
                                            index: 7,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[1].image,
                                            index: 8,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[19].image,
                                            index: 9,
                                          ),
                                          NumberCard(
                                            image: TMDB.imageId +
                                                snapshot.data[2].image,
                                            index: 10,
                                          ),
                                        ],
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Row(
                                          children: [
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                            playListShimmer(),
                                          ],
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
