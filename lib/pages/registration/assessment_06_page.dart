import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_07_page.dart';

class Assessment06Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment06Page(this.uthUser);

  @override
  _Assessment06PageState createState() => _Assessment06PageState();
}

class _Assessment06PageState extends State<Assessment06Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Nichtraucher";
    }
    if (index == 1) {
      return "Partyraucher";
    }
    if (index == 2) {
      return "Gelegenheitsraucher";
    }
    if (index == 3) {
      return "Raucher";
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
          AssessmentTitle('Bist du Raucher?'),
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
                  child: Text('Nichtraucher'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Partyraucher (1-2 mal im Monat)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Gelegenheitsraucher (1-2 mal pro Woche)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Raucher (täglich)'),
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
                      widget.uthUser.ass06Smoker = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment07Page(widget.uthUser)));
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
