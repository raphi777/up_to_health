import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_24_page.dart';

class Assessment23Page extends StatefulWidget {
  @override
  _Assessment23PageState createState() => _Assessment23PageState();
}

class _Assessment23PageState extends State<Assessment23Page> {
  int lastIndex;
  List<bool> _selections = List.generate(2, (_) => false);
  String dropdownValue = 'Pollenallergie (Heuschnupfen)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Leidest du an Allergien?'),
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
                  child: Text('Nein'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ja'),
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
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Pollenallergie (Heuschnupfen)',
                'Hausstauballergie',
                'Tierallergie',
                'Nahrungsallergie',
                'Andere']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ButtonContinue(Assessment24Page()),
        ],
      ),
    );
  }
}

