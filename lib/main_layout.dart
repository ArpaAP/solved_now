import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:solved_now/pages/home.dart';
import 'package:solved_now/pages/my.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final pageController = PageController(initialPage: 0, keepPage: true);
  int _selectedIndex = 0;

  static final _pages = <Widget>[
    const HomePage(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,
            ),
          ),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey[300]!, width: 0.5)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            iconSize: 22,
            selectedFontSize: 13,
            unselectedFontSize: 11,
            selectedItemColor: TW3Colors.neutral.shade700,
            unselectedItemColor: TW3Colors.neutral.shade400,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(
                () {
                  _selectedIndex = index;
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart,
                  );
                },
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(TablerIcons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(TablerIcons.book_2),
                label: '문제',
              ),
              BottomNavigationBarItem(
                icon: Icon(TablerIcons.message_heart),
                label: '기여',
              ),
              BottomNavigationBarItem(
                icon: Icon(TablerIcons.swords),
                label: '아레나',
              ),
              BottomNavigationBarItem(
                icon: Icon(TablerIcons.user_code),
                label: 'MY',
              ),
            ],
          ),
        ));
  }
}
