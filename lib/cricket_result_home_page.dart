import 'package:flutter/material.dart';

import 'page/fixtures/fixtures_page.dart';
import 'page/results/result_page.dart';

class CricketResultHomePage extends StatefulWidget {
  const CricketResultHomePage({super.key});

  @override
  _CricketResultHomePageState createState() => _CricketResultHomePageState();
}

class _CricketResultHomePageState extends State<CricketResultHomePage>
    with
        AutomaticKeepAliveClientMixin<CricketResultHomePage>,
        TickerProviderStateMixin {
  late PageController _pageController;
  late int _currentPageIndex;

  final List<Widget> _pages = const [
    FixturesPage(key: PageStorageKey('Page1')),
    ResultPage(key: PageStorageKey('Page2')),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.animateToPage(
      _currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          FixturesPage(),
          ResultPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0F2027),
        currentIndex: _currentPageIndex,
        onTap: _onBottomNavItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: 'Fixtures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Results',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 138, 185, 255),
        unselectedItemColor: const Color.fromARGB(255, 66, 123, 149),
      ),
    );
  }
}
