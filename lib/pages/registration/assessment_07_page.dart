import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_08_page.dart';

class Assessment07Page extends StatefulWidget {
  @override
  _Assessment07PageState createState() => _Assessment07PageState();
}

class _Assessment07PageState extends State<Assessment07Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Hast du eine Sehhilfe?'),
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
                  child: Text('Ja ich bin eine Brillenschlange'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ja ich trage Kontaktlinsen'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nein aber ich sehe etwas schlechter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nein ich sehe perfekt'),
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
          ButtonContinue(Assessment08Page()),
        ],
      ),
    );
  }
}

