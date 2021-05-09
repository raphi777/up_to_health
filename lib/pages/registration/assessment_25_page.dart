import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'package:up_to_health/widgets/month_picker_custom.dart';
import 'assessment_26_page.dart';

class Assessment25Page extends StatefulWidget {
  @override
  _Assessment25PageState createState() => _Assessment25PageState();
}

class _Assessment25PageState extends State<Assessment25Page> {
  int lastIndex;
  List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wann war deine letzte Blutabnahme?'),
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
                  child: Text('Zum unten angegebenen Zeitpunkt'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Weiß ich nicht'),
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
          MonthPickerCustom(),
          ButtonContinue(Assessment26Page()),
        ],
      ),
    );
  }
}

