import 'package:flutter/material.dart';
import 'package:netflix_ui/Home%20Page/categories.dart';
import 'package:netflix_ui/Home%20Page/home_utilities.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "TV Shows",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => CategoriesPage(isCategory: false));
                      },
                      child: const Text(
                        "Movies",
                        style: TextStyle(color: Colors.white, fontSize: 15),
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
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
          SliverToBoxAdapter(
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
                          Container(
                            height: 550,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/c5.jpeg",
                                    ),
                                    fit: BoxFit.cover)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                                        color: Colors.white, fontSize: 10),
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
                          padding:
                              EdgeInsets.only(bottom: 15, left: 15, top: 15),
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
                          child: Row(
                            children: [
                              playList("assets/c1.jpeg", "S1:E5"),
                              playList("assets/c4.jpeg", "2h27m"),
                              playList("assets/c3.jpg", "S2:E7"),
                              playList("assets/c2.jpeg", "1h45m"),
                            ],
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
                          child: Row(
                            children: [
                              popularOnNetflix("assets/l1.jpg"),
                              popularOnNetflix("assets/l2.jpg"),
                              popularOnNetflix("assets/l3.jpeg"),
                              popularOnNetflix("assets/l4.jpeg"),
                            ],
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
                          child: Row(
                            children: [
                              trendingList("assets/l1.jpg"),
                              trendingList("assets/l2.jpg"),
                              trendingList("assets/l3.jpeg"),
                              trendingList("assets/l4.jpeg"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
