import 'package:flutter/material.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/animes/screens/home.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/screens/home.dart';
import 'package:umai/social/screens/home.dart';
import 'package:umai/utils/themes.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _mainPageIndex = 0;
  final pages = const [
    {'title': 'Social', 'page': SocialHomeScreen()},
    {'title': 'Évènements', 'page': SizedBox()},
    {'title': 'Pour toi', 'page': SizedBox()},
    {'title': 'Animes', 'page': AnimeHomeScreen()},
    {'title': 'Quiz', 'page': QuizHomeScreen()},
  ];
  final pageController = PageController(initialPage: _mainPageIndex);
  int index = 0;

  void setPage([int value = _mainPageIndex]) {
    setState(() {
      pageController.jumpToPage(value);
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: index == _mainPageIndex,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) setPage();
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(pages[index]['title'] as String),
          centerTitle: true,
          systemOverlayStyle: Theme.of(context)
              .appBarTheme
              .systemOverlayStyle
              ?.copyWith(
                systemNavigationBarColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                systemNavigationBarDividerColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AccountScreen()));
              },
              child: const UserProfilePicture(),
            ),
            const SizedBox(width: 16.0)
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (value) => setState(() => index = value),
          children: pages.map((page) => page['page'] as Widget).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: setPage,
          currentIndex: index,
          selectedItemColor: Colors.amber,
          useLegacyColorScheme: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIconWithDecoration(
                  icon: Icons.location_on, selected: index == 0),
              label: pages[0]['title'] as String,
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithDecoration(
                  icon: Icons.commute, selected: index == 1),
              label: pages[1]['title'] as String,
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithDecoration(
                  icon: Icons.bookmark_outline_rounded, selected: index == 2),
              label: pages[2]['title'] as String,
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithDecoration(
                  icon: Icons.add_circle_outline_rounded, selected: index == 3),
              label: pages[3]['title'] as String,
            ),
            BottomNavigationBarItem(
              icon: _buildIconWithDecoration(
                  icon: Icons.notifications_outlined, selected: index == 4),
              label: pages[4]['title'] as String,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithDecoration({required icon, required bool selected}) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: selected
            ? BoxDecoration(
                color: AppTheme.primaryYellow,
                borderRadius: BorderRadius.circular(16))
            : null,
        child: Icon(
          icon,
        ));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
