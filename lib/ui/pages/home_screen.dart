import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/pages/feed_screen.dart';
import 'package:instagram_clone/ui/pages/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
      print(_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: const [
          FeedScreen(),
          SearchScreen(),
          Scaffold(),
          Scaffold(),
          Scaffold()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_file_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.video_file,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
        ],
        onTap: onPageChanged,
        currentIndex: _page,
      ),
    );
  }
}
