import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_03_page.dart';

class Assessment02Page extends StatefulWidget {
  @override
  _Assessment02PageState createState() => _Assessment02PageState();
}

class _Assessment02PageState extends State<Assessment02Page> {
  int lastIndex;
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Welches Geschlecht hast du ?'),
          ToggleButtons(
            direction: Axis.vertical,
            constraints: BoxConstraints(minWidth: 150, minHeight: 40),
            renderBorder: true,
            borderRadius: BorderRadius.circular(30),
            borderWidth: 5,
            children: [
              Text('Weiblich'),
              Text('Männlich'),
              Text('Möchte ich nicht sagen'),
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
          ButtonContinue(Assessment03Page()),
        ],
      ),
    );
  }
}
