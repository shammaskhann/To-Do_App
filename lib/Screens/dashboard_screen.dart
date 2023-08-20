import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:practise_app_3/Screens/Home/homeScreen.dart';
import 'package:practise_app_3/Screens/Setting/settingMenu.dart';
import 'package:practise_app_3/Screens/Starred/starredScreen.dart';
class dashBoardScreen extends StatefulWidget {
  const dashBoardScreen({super.key});

  @override
  State<dashBoardScreen> createState() => _dashBoardScreenState();
}

class _dashBoardScreenState extends State<dashBoardScreen> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  /// widget list
  final List<Widget> bottomBarPages = const [
    homeScreen(),
    starredScreen(),
    settingMenu(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          bottomBarWidth: MediaQuery.of(context).size.width * 0.5,
          color: Colors.white,
          showLabel: false,
          notchColor: Colors.white,
          removeMargins: false,
          durationInMilliSeconds: 200,
          bottomBarItems:const [
            BottomBarItem
              (inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.black,
            ), activeItem: Icon(Icons.home_filled,
            color: Colors.amber,)),
            BottomBarItem(inActiveItem: Icon(
              Icons.star,
              color: Colors.black,
            ), activeItem: Icon(Icons.star,
              color: Colors.amber,)),
            BottomBarItem(inActiveItem: Icon(
              Icons.settings,
              color: Colors.black,
            ), activeItem: Icon(Icons.settings,
              color: Colors.amber,))
          ],
          onTap:(index){
          _pageController.jumpToPage(index);
        },),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

