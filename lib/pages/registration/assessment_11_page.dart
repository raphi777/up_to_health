import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_12_page.dart';

class Assessment11Page extends StatefulWidget {
  @override
  _Assessment11PageState createState() => _Assessment11PageState();
}

class _Assessment11PageState extends State<Assessment11Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie viel bewegst du dich?'),
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
                  child: Text('Sportskanone (>4x Sport pro Woche)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Trying my best (2-3x die Woche Sport)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ist Spazierengehen auch Sport? (weniger als 1x Sport pro Woche)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Couch Potatoe (die einzige Bewegung ist der Weg zum Kühlschrank)'),
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
                });
              },
            ),
          ),
          ButtonContinue(Assessment12Page()),
        ],
      ),
    );
  }
}
