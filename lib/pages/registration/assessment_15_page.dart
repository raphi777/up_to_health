import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_16_page.dart';

class Assessment15Page extends StatefulWidget {
  @override
  _Assessment15PageState createState() => _Assessment15PageState();
}

class _Assessment15PageState extends State<Assessment15Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
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
                });
              },
            ),
          ),
          ButtonContinue(Assessment16Page()),
        ],
      ),
    );
  }
}

