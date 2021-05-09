import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_09_page.dart';

class Assessment08Page extends StatefulWidget {
  @override
  _Assessment08PageState createState() => _Assessment08PageState();
}

class _Assessment08PageState extends State<Assessment08Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie ernährst du dich?'),
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
                  child: Text('Sehr gesund (viel Obst & Gemüse, wenig tierische Proteine)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ausgewogen (Viel Gemüse aber auch ab und an mal ein Steak)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Mal so mal so (hin und wieder Fast-food aber auch ab und an Gesundes)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ungesund (Selten Gemüse, viel Fettiges, viele Süßigkeiten)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich achte nicht darauf'),
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
          ButtonContinue(Assessment09Page()),
        ],
      ),
    );
  }
}

