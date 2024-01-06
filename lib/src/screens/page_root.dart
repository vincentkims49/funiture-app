import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'pages/home.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';

class PageRoot extends StatefulWidget {
  const PageRoot({super.key});

  @override
  State<PageRoot> createState() => _PageRootState();
}

class _PageRootState extends State<PageRoot> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const HomePage(),
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  int maxCount = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.deepPurple,
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.deepPurple,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.home,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Iconsax.home,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.search_normal_1,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Iconsax.search_normal_1,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.heart,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Iconsax.heart,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.user,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Iconsax.user,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
