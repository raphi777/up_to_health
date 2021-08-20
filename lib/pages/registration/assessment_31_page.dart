import 'package:flutter/material.dart';
import 'package:up_to_health/authentication/add_user.dart';
import 'package:up_to_health/authentication/authentication_widget.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';

class Assessment31Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment31Page(this.uthUser);

  @override
  _Assessment31PageState createState() => _Assessment31PageState();
}

class _Assessment31PageState extends State<Assessment31Page> {
  int lastIndex;
  List<bool> _selections = List.generate(2, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Gesetzlich";
    }
    if (index == 1) {
      return "Privat";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Letzte Frage: Wie bist du versichert?'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToggleButtons(
              direction: Axis.vertical,
              constraints: BoxConstraints(minWidth: 150, minHeight: 40),
              renderBorder: true,
              borderRadius: BorderRadius.circular(30),
              borderWidth: 5,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Gesetzlich versichert'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Privat versichert'),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _selections.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _selections[buttonIndex] = true;
                    } else {
                      _selections[buttonIndex] = false;
                    }
                  }
                  lastIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (lastIndex != null) {
                      widget.uthUser.ass31Insurance = _getSelection(lastIndex);
                      AddUser().addUserToFirebase(widget.uthUser);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthenticationWidget()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Bitte treffen Sie eine Auswahl.")));
                    }
                  },
                  child: Text('Abschließen'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(width / 1.2, width / 8)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
