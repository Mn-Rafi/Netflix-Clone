import 'package:flutter/material.dart';
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
        primarySwatch: Colors.grey,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Color.fromARGB(255, 12, 12, 12),
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

List<Widget> pages = [
  ScreenHome(),
  ScreenNewAndHot(),
  ScreenFastLaugh(),
  ScreenSearch(),
  ScreenDownloads()
];

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          pages[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
            ),
          )
        ],
      ),
    );
  }
}
