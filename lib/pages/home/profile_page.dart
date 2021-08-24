import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_to_health/authentication/authentication_service.dart';
import 'package:up_to_health/pages/home/stats_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut(BuildContext context) async {
    try {
      final _auth = Provider.of<AuthenticationService>(context, listen: false);
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your E-Mail: ' + _auth.currentUser.email.toString(),
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your User-ID: ' + _auth.currentUser.uid,
                  style: TextStyle(fontSize: 16)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatsPage()));
                        },
                        child: Card(
                            child: Container(
                                width: width * 0.7,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Stats',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ))),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () => _signOut(context), child: Text("Sign out")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
