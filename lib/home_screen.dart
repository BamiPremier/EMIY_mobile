import 'package:flutter/material.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/social/screens/social_view.dart';
import 'package:umai/utils/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String get title => _selectedIndex == 1 ? "Social" : "Autre page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.primaryYellow,
        title: Text(title),
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
      body: Center(
        child:
            _selectedIndex == 0 ? const SocialPage() : const Text('Other Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIconWithDecoration(
                icon: Icons.location_on, selected: _selectedIndex == 0),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithDecoration(
                icon: Icons.library_add_check_sharp,
                selected: _selectedIndex == 1),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithDecoration(
                icon: Icons.add_alarm, selected: _selectedIndex == 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithDecoration(
                icon: Icons.add_circle_outline_rounded,
                selected: _selectedIndex == 3),
            label: 'Animes',
          ),
          BottomNavigationBarItem(
            icon: _buildIconWithDecoration(
                icon: Icons.notifications, selected: _selectedIndex == 4),
            label: 'Quiz',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }

  _buildIconWithDecoration({required icon, required bool selected}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: selected
            ? BoxDecoration(
                color: ThemeApp.primaryYellow,
                borderRadius: BorderRadius.circular(16))
            : null,
        child: Icon(
          icon,
        ));
  }
}
