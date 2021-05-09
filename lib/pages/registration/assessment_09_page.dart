import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_10_page.dart';

class Assessment09Page extends StatefulWidget {
  @override
  _Assessment09PageState createState() => _Assessment09PageState();
}

class _Assessment09PageState extends State<Assessment09Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
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
                });
              },
            ),
          ),
          ButtonContinue(Assessment10Page()),
        ],
      ),
    );
  }
}

