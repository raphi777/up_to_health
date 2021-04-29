import 'package:flutter/material.dart';
import 'package:up_to_health/pages/home/compass_page.dart';
import 'package:up_to_health/pages/home/notifications_page.dart';
import 'package:up_to_health/pages/home/principals_categories_page.dart';
import 'package:up_to_health/pages/home/principals_page.dart';
import 'package:up_to_health/pages/home/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            PrincipalsCategoriesPage(),
            NotificationsPage(),
            CompassPage(),
            ProfilePage(),
          ],
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Principals"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Benachrichtigungen"),
            BottomNavigationBarItem(icon: Icon(Icons.navigation), label: "Compass"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}
