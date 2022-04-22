import 'package:flutter/material.dart';
import 'package:netflix_ui/API/apis.dart';
import 'package:netflix_ui/API/tmdb_links.dart';
import 'package:netflix_ui/New%20and%20hot/newandhot_utilities.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import 'package:shimmer/shimmer.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(38),
          child: AppBar(
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
                        'New & Hot',
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
        ),
        body: ScrollableListTabView(
          tabs: [
            ScrollableListTab(
              tab: ListTab(
                label: '🍿 Coming Soon',
                activeBackgroundColor: Colors.white,
                inactiveBackgroundColor: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: HttpServices().getUpcoming(TMDB.upComing),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<dynamic> list = snapshot.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: ((context, index) {
                              return ComingSoonWidgets(
                                width: width,
                                movieName: '${list[index].title}',
                                movieDescription: '${list[index].overview}',
                                date: DateFormat('MMM')
                                    .format(
                                      DateTime.parse(
                                        '${list[index].date}',
                                      ),
                                    )
                                    .toUpperCase(),
                                imageURL: '${list[index].image}',
                                day: DateFormat('dd').format(
                                  DateTime.parse('${list[index].date}'),
                                ),
                                comingSoonDate:
                                    'Coming On ${DateFormat('MMMM dd').format(
                                  DateTime.parse('${list[index].date}'),
                                )}',
                              );
                            }),
                          );
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.grey,
                              width: 300,
                              height: 1500,
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            ScrollableListTab(
              tab: ListTab(
                borderRadius: BorderRadius.circular(30),
                label: '🔥 Everyone\'s watching',
                activeBackgroundColor: Colors.white,
                inactiveBackgroundColor: Colors.black,
              ),
              body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: HttpServices().getUpcoming(TMDB.upComing),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<dynamic> list = snapshot.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length - 8,
                            itemBuilder: ((context, index) {
                              return EveryOneWatch(
                                width: width,
                                movieName: '${list[index + 5].title}',
                                movieDescription: '${list[index + 5].overview}',
                                date: DateFormat('MMM')
                                    .format(
                                      DateTime.parse(
                                        '${list[index + 5].date}',
                                      ),
                                    )
                                    .toUpperCase(),
                                imageURL: '${list[index + 5].image}',
                                day: DateFormat('dd').format(
                                  DateTime.parse('${list[index + 5].date}'),
                                ),
                                comingSoonDate:
                                    'Coming On ${DateFormat('MMMM dd').format(
                                  DateTime.parse('${list[index + 5].date}'),
                                )}',
                              );
                            }),
                          );
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.grey,
                              width: 300,
                              height: 1500,
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            ScrollableListTab(
              tab: ListTab(
                borderRadius: BorderRadius.circular(30),
                label: '🔟 Top 10',
                activeBackgroundColor: Colors.white,
                inactiveBackgroundColor: Colors.black,
              ),
              body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: HttpServices().getUpcoming(TMDB.upComing),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<dynamic> list = snapshot.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return TopTen(
                                index: index+1,
                                width: width,
                                movieName: '${list[index + 3].title}',
                                movieDescription:
                                    '${list[index + 3 + 3].overview}',
                                date: DateFormat('MMM')
                                    .format(
                                      DateTime.parse(
                                        '${list[index + 3].date}',
                                      ),
                                    )
                                    .toUpperCase(),
                                imageURL: '${list[index + 3].image}',
                                day: DateFormat('dd').format(
                                  DateTime.parse('${list[index + 3].date}'),
                                ),
                                comingSoonDate:
                                    'Coming On ${DateFormat('MMMM dd').format(
                                  DateTime.parse('${list[index + 3].date}'),
                                )}',
                              );
                            }),
                          );
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              color: Colors.grey,
                              width: 300,
                              height: 1500,
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
