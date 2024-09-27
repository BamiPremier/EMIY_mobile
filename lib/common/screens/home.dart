import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/account/screens/account_screen.dart';
import 'package:umai/animes/screens/home.dart';
import 'package:umai/common/bloc/home_cubit.dart';
import 'package:umai/social/screens/home.dart';
import 'package:umai/utils/themes.dart';

class HomeScreen extends StatelessWidget {
  final pages = const [
    {'title': 'Social', 'page': SocialHomeScreen()},
    {'title': 'Évènements', 'page': SizedBox()},
    {'title': 'Pour toi', 'page': SizedBox()},
    {'title': 'Animes', 'page': AnimeHomeScreen()},
    {'title': 'Quiz', 'page': SizedBox()},
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) {
        return Scaffold(
          appBar: AppBar(
            title: Text(pages[index]['title'] as String),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle, color: Colors.red, size: 40),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
                },
              ),
            ],
          ),
          body: pages[index]['page'] as Widget,
          bottomNavigationBar: BottomNavigationBar(
            onTap: context.read<HomeCubit>().set,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildIconWithDecoration(
                    icon: Icons.location_on,
                    selected: index == 0
                ),
                label: pages[0]['title'] as String,
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithDecoration(
                    icon: Icons.commute,
                    selected: index == 1),
                label: pages[1]['title'] as String,
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithDecoration(
                    icon: Icons.bookmark_outline_rounded,
                    selected: index == 2),
                label: pages[2]['title'] as String,
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithDecoration(
                    icon: Icons.add_circle_outline_rounded,
                    selected: index == 3),
                label: pages[3]['title'] as String,
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithDecoration(
                    icon: Icons.notifications, selected: index == 4),
                label: pages[4]['title'] as String,
              ),
            ],
            currentIndex: index,
            selectedItemColor: Colors.amber,
          ),
        );
      }
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
}
