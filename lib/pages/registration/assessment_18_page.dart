import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_19_page.dart';

class Assessment18Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment18Page(this.uthUser);
  @override
  _Assessment18PageState createState() => _Assessment18PageState();
}

class _Assessment18PageState extends State<Assessment18Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Mehr als 8 Stunden";
    }
    if (index == 1) {
      return "Zwischen 7 und 8 Stunden";
    }
    if (index == 2) {
      return "Zwischen 6 und 7 Stunden";
    }
    if (index == 3) {
      return "Weniger als 6 Stunden";
    }
    if (index == 4) {
      return "Schlafstörungen";
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
          AssessmentTitle('Wie viele Stunden Schlaf bekommst durchschnittlich du pro Nacht?'),
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
                  child: Text('Mehr als 8 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Im Schnitt ungefähr zwischen 7 und 8 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Zwischen 6 und 7 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Weniger als 6 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Mal mehr mal weniger aber ich leide generell unter Schlafstörungen'),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
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
                      widget.uthUser.ass18Sleep = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment19Page(widget.uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Bitte treffen Sie eine Auswahl.")));
                    }
                  },
                  child: Text('Weiter'),
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

