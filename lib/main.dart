import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:netflix_ui/Downloads/downloads.dart';
import 'package:netflix_ui/Fast%20Laugh/fast_laught.dart';
import 'package:netflix_ui/Home%20Page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/New%20and%20hot/new_and_hot.dart';
import 'package:netflix_ui/Search/search.dart';
import 'package:netflix_ui/extras.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        cardColor: Colors.black,
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      title: 'Netflix',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: IndexedStack(index: _currentIndex, children: const <Widget>[
              ScreenHome(),
              ScreenNewAndHot(),
              ScreenFastLaugh(),
              ScreenSearch(),
              ScreenDownloads()
            ]),
          ),
        ],
      ),
    );
  }
}
