import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_10_page.dart';

class Assessment09Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment09Page(this.uthUser);
  @override
  _Assessment09PageState createState() => _Assessment09PageState();
}

class _Assessment09PageState extends State<Assessment09Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Ich achte genau darauf";
    }
    if (index == 1) {
      return "Mehr als 4 Liter";
    }
    if (index == 2) {
      return "Weniger als 1 Liter";
    }
    if (index == 3) {
      return "Nicht sicher vermute genug";
    }
    if (index == 4) {
      return "Nicht sicher vermute zu wenig";
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
          AssessmentTitle('Wie viel Wasser trinkst du am Tag? '),
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
                  child: Text('Ich achte genau darauf dass ich meiner Körpergröße entsprechend genügend Wasser zu mir nehme'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Definitiv mehr als 4 Liter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Definitiv weniger als 1 Liter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich bin mir nicht sicher aber ich vermute genug'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich bin mir nicht sicher aber ich vermute zu wenig'),
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
                      widget.uthUser.ass09Water = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment10Page(widget.uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Bitte treffen Sie eine Auswahl.")));
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

