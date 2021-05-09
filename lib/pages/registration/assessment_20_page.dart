import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_21_page.dart';

class Assessment20Page extends StatefulWidget {
  @override
  _Assessment20PageState createState() => _Assessment20PageState();
}

class _Assessment20PageState extends State<Assessment20Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie sexuell aktiv bist du und wie häufig wechselst du den Partner?'),
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
                  child: Text('Aktiv mit teils mehreren Partnerwechseln im Monat'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Aktiv mit seltenerem Partnerwechseln (einmal alle 3-4 Monate)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Aktiv jedoch bin ich einem Partner fest zugeschrieben'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Inaktiv'),
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
          ButtonContinue(Assessment21Page()),
        ],
      ),
    );
  }
}

