import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_11_page.dart';

class Assessment10Page extends StatefulWidget {
  @override
  _Assessment10PageState createState() => _Assessment10PageState();
}

class _Assessment10PageState extends State<Assessment10Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie viel Alkohol konsumierst du in einer Woche?'),
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
                  child: Text('Jeden Tag und das Wochenende ist nochmal ein besonderes Highlight'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich verzichte unter der Woche auf Alkohol aber lasse es am Wochenende dafür richtig krachen (ca. >1 Flasche Wein jeweils Freitag, Samstag und Sonntag)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich verzichte unter der Woche auf Alkohol und am Wochenende gönne ich mir nur zum richtigen Gericht z.B. ein Glas Wein'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich trinke nur zu besonderen Anlässen'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich lehne Alkohol strikt ab'),
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
          ButtonContinue(Assessment11Page()),
        ],
      ),
    );
  }
}

