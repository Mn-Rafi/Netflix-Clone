import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:netflix_ui/API/apis.dart';
import 'package:netflix_ui/API/tmdb_links.dart';
import 'package:netflix_ui/New%20and%20hot/newandhotutilities2.dart';
import 'package:netflix_ui/Search/search_utilities.dart';
import 'package:shimmer/shimmer.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  Icon myIcon = const Icon(
    FeatherIcons.search,
    color: Colors.white,
  );
  Widget? myField;
  String searchInput = '';
  bool searchFill = false;

  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(128, 162, 162, 162),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                onSubmitted: (value) {
                                  setState(() {
                                    searchInput = value;
                                  });
                                },
                                style: const TextStyle(color: Colors.white),
                                controller: inputController,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        inputController.text = '';
                                        searchInput = '';
                                      });
                                    },
                                    child: const Icon(Icons.clear),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      searchInput == '' ? 'Top Searches' : 'Movies & TV',
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              searchInput == ''
                  ? FutureBuilder(
                      future: HttpServices().getUpcoming(TMDB.upComing),
                      builder: (context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? ListView.separated(
                                padding: const EdgeInsets.all(12),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) => Row(
                                      children: [
                                        SizedBox(
                                            width: 130,
                                            height: 75,
                                            child: Image.network(
                                              TMDB.imageId +
                                                  snapshot.data[index].image,
                                              fit: BoxFit.cover,
                                            )),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data[index].title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          CupertinoIcons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        )
                                      ],
                                    ))
                            : Shimmer.fromColors(
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: 20,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Row(
                                          children: [
                                            Container(
                                              width: 130,
                                              height: 75,
                                              color: Colors.grey,
                                            ),
                                            const Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Name of the movie',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const Icon(
                                              CupertinoIcons.play_circle,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                          ],
                                        )),
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                              );
                      })
                  : FutureBuilder(
                      future: HttpServices().getTrending(TMDB.trending),
                      builder: (context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? GridView.builder(
                                padding: const EdgeInsets.all(9),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 1.4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) =>
                                    CustomGridContainer(
                                        url: TMDB.imageId +
                                            snapshot.data[index].image),
                              )
                            : Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(9),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1.4,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder: (context, index) => Container(
                                    color: Colors.grey,
                                    height: 100,
                                  ),
                                ),
                              );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
