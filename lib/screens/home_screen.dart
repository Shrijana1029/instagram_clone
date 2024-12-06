import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/screens/explore_screen.dart';
import 'package:instagram_clone/screens/extra.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile.dart';

import 'package:instagram_clone/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    FeedScreen(),
    ExploreScreen(),
    SearchScreen(),
    FeedScreen(),
    Profile()
  ];

  void _tappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset(
      //     'assets/img/insta.png',
      //     width: 150,
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(FontAwesomeIcons.heart),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //         onPressed: () {}, icon: const Icon(FontAwesomeIcons.comment))
      //   ],
      // ),
      ///////////////////////BODY
      body: IndexedStack(
        index: _selectedIndex, // Show the selected page
        children: _pages,
      ),
      // child: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blue,
          onTap: _tappedItem,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.add), label: 'Add'),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: 'explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.circle),
              label: 'Profile',
            ),
          ]),
    );
  }
}
