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
  UthUser uthUser;
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

  /*Future<void> _getUser() async {
    UthUser user = new UthUser(
        email: "giesela@mail.xy",
        ass01Name: "Giesela",
        ass02Gender: "FEMALE",
        ass03Birthday: new DateTime(1990, 10, 10),
        ass04Height: 174,
        ass05Weight: 70,
        ass06Smoker: "Nichtraucher",
        ass07Visionaid: "Kontaktlinsen",
        ass08Nutrition: "Mal so mal so",
        ass09Water: "Weniger als 1 Liter",
        ass10Alcohol: "Nur Wochenende, viel",
        ass11Sport: "Wenig",
        ass12Industry: "Bau",
        ass13Bodyposture: "Aufrecht",
        ass14Backpain: true,
        ass15Stress: "Manchmal Stressig",
        ass16Physicalcondition: "Nicht perfekt aber Glücksmomente",
        ass17Outdoors: "Weniger als eine Stunde",
        ass18Sleep: "Zwischen 6 und 7 Stunden",
        ass19Snoring: "Manchmal",
        ass20Sex: "Inaktiv",
        ass21Supplements: "Unregelmässig",
        ass22Preexistingdiseases: "Diabetes",
        ass23Allergies: "keine",
        ass24Medication: true,
        ass25Bloodsample: new DateTime(2020, 5, 1),
        ass26Dentist: new DateTime(1900, 1, 1),
        ass27Generalpractitioner: new DateTime(1900, 1, 1),
        ass28Heart: true,
        ass29Aneurysmen: false,
        ass30Pregnant: false,
        ass31Insurance: "Gesetzlich",
        dailyScore: []);
    var currentUser = FirebaseAuth.instance.currentUser;
    var uid = currentUser.uid;
    print('$uid');
    print('getting user data');
    *//*await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get()
        .then((snapshot) {
      user.fromMap(snapshot.data());
    });*//*
    print("Current User Mail: " + user.email);
    uthUser = user;
  }*/

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null && !snapshot.hasError) {
            UthUser user = new UthUser();
            snapshot.data.reference.get().then((snapshot) {
              user.fromMap(snapshot.data());
              print("Current User Mail: " + user.email);
              uthUser = user;
            });
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
                    NotificationsPage(uthUser),
                    CompassPage(uthUser),
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
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Principals"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: "Benachrichtigungen"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.navigation), label: "Compass"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profil"),
                  ],
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
/*
  @override
  Widget build(BuildContext context) {
    if (uthUser == null) {
      return FutureBuilder(
        future: _getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
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
                    NotificationsPage(uthUser),
                    CompassPage(uthUser),
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
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Principals"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: "Benachrichtigungen"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.navigation), label: "Compass"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profil"),
                  ],
                ),
              ),
            );
          if (snapshot.connectionState == ConnectionState.waiting)
            return Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: CircularProgressIndicator(),
                ));
          return Container();
        },
      );
    } else {
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
              NotificationsPage(uthUser),
              CompassPage(uthUser),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Principals"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Benachrichtigungen"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.navigation), label: "Compass"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ],
          ),
        ),
      );
    }
  }*/
}
