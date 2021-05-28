import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/pages/home/compass_page.dart';
import 'package:up_to_health/pages/home/notifications_page.dart';
import 'package:up_to_health/pages/home/principals_categories_page.dart';
import 'package:up_to_health/pages/home/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetUser(),
    );
  }
}

class GetUser extends StatefulWidget {
  GetUserState createState() => GetUserState();
}

class GetUserState extends State {
  UthUser uthUser = new UthUser();
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<UthUser> getUser() async {
    UthUser user = new UthUser();
    var currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.doc('users/' + currentUser.uid).get().then((snapshot) {
      user.fromMap(snapshot.data());
    });
    print("Current User Mail: " + user.email);
    uthUser = user;
    return user;
  }

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
    return MaterialApp(
      title: 'UpToHealth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            PrincipalsCategoriesPage(uthUser),
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
