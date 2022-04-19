
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

//BottomNavigation Bar custom

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;
  const CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: widget.onTap,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.currentIndex,
        backgroundColor: const Color.fromARGB(232, 0, 0, 0),
        fixedColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 9,
        unselectedItemColor: const Color.fromARGB(255, 174, 174, 174),
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(
              label: "New and Hot", icon: Icon(Icons.photo_library_outlined)),
          BottomNavigationBarItem(
              label: "Fast Laughs", icon: Icon(Icons.emoji_emotions_outlined)),
          BottomNavigationBarItem(
              label: "Search", icon: Icon(FeatherIcons.search)),
          BottomNavigationBarItem(
            label: "Downloads",
            icon: Icon(Icons.file_download),
          ),
        ]);
  }
}
