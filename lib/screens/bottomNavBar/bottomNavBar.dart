// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/chat/chat.dart';
import 'package:hello_neighbour/screens/explore/explore.dart';
import 'package:hello_neighbour/screens/user/user_profile.dart';

import '../home/home.dart';


class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 4;

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    ExploreScreen(),
    ChatScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
              (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length<=maxCount) ? AnimatedNotchBottomBar(
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          notchBottomBarController: _controller,
          color: Colors.white,
          showLabel: false,
          notchColor: Colors.black87,
          removeMargins: false,
          bottomBarWidth: 500,
          durationInMilliSeconds: 300,
          bottomBarItems: [
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Home',
            ),

            const BottomBarItem(
              inActiveItem: Icon(
                Icons.collections_bookmark_outlined,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.collections_bookmark_outlined,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Collection',
            ),

            const BottomBarItem(
              inActiveItem: Icon(
                Icons.chat_bubble,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.chat_bubble,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Search',
            ),

            const BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.person,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Profile',
            ),
          ]

      )
          : null,
    );
  }
}




class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

