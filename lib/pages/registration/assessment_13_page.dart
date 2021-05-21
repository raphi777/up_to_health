import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_14_page.dart';

class Assessment13Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment13Page(this.uthUser);

  @override
  _Assessment13PageState createState() => _Assessment13PageState();
}

class _Assessment13PageState extends State<Assessment13Page> {
  int lastIndex;
  List<bool> _selections = List.generate(3, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Aufrecht";
    }
    if (index == 1) {
      return "In den Stuhl sinken";
    }
    if (index == 2) {
      return "Schlechte Haltung";
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
          AssessmentTitle('Wie ist deine Körperhaltung?'),
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
                  child: Text('Aufrecht (sowohl sitzend als auch stehend)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Ich stehe zwar aufrecht aber neige gerne dazu in den Stuhl zu sinken'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Schlechte Haltung'),
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
                      widget.uthUser.ass13Bodyposture = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment14Page(widget.uthUser)));
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
