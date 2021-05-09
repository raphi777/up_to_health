import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_18_page.dart';

class Assessment17Page extends StatefulWidget {
  @override
  _Assessment17PageState createState() => _Assessment17PageState();
}

class _Assessment17PageState extends State<Assessment17Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie lange bist du durchschnittlich im Freien pro Tag?'),
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
                  child: Text('Mehr als 4 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Zwischen 2 und 4 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Zwischen 1 und 2 Stunden'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Weniger als eine Stunde'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Weiß ich nicht / so gut wie gar nicht'),
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
          ButtonContinue(Assessment18Page()),
        ],
      ),
    );
  }
}

