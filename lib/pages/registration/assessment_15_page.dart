import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_16_page.dart';

class Assessment15Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment15Page(this.uthUser);
  @override
  _Assessment15PageState createState() => _Assessment15PageState();
}

class _Assessment15PageState extends State<Assessment15Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Nahe Burnout";
    }
    if (index == 1) {
      return "Stressig aber Spass";
    }
    if (index == 2) {
      return "Manchmal Stressig";
    }
    if (index == 3) {
      return "Selten Stressig";
    }
    if (index == 4) {
      return "Total Entspannt";
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
          AssessmentTitle('Wie stressig ist dein Beruf/Studium/Ausbildung?'),
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
                  child: Text('Dem Burnout nahe'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Schon sehr stressig aber es macht mir Spaß'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Manchmal etwas stressig'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nur seltenst stressig'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total entspannt'),
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
                      widget.uthUser.ass15Stress = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment16Page(widget.uthUser)));
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

