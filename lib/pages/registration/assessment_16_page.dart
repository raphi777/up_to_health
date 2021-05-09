import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_17_page.dart';

class Assessment16Page extends StatefulWidget {
  @override
  _Assessment16PageState createState() => _Assessment16PageState();
}

class _Assessment16PageState extends State<Assessment16Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie würdest du deine allgemeine mentale Verfassung beschreiben?'),
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
                  child: Text('Ich bin überglücklich mit meinem Leben so wie es ist'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich finde es läuft nicht alles perfekt in meinem Leben habe aber dennoch Glücksmomente'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Darüber habe ich mir noch nie Gedanken gemacht aber ich schätze es passt alles so wie es ist'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich habe oft Selbstzweifel komme damit aber zurecht'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich bin unzufrieden mit mir und meinem Leben'),
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
          ButtonContinue(Assessment17Page()),
        ],
      ),
    );
  }
}

