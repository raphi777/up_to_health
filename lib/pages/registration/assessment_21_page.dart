import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_22_page.dart';

class Assessment21Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment21Page(this.uthUser);
  @override
  _Assessment21PageState createState() => _Assessment21PageState();
}

class _Assessment21PageState extends State<Assessment21Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Ja ich bin Experte";
    }
    if (index == 1) {
      return "Ja die klassichen NEMs";
    }
    if (index == 2) {
      return "Unregelmässig";
    }
    if (index == 3) {
      return "Nein";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Nimmst du regelmäßig Nahrungsergänzungsmittel zu dir?'),
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
                  child: Text('Ich bin ein Experte in dem Bereich und nehme über die klassischen hinaus noch NEMs wie Spermidine NMN Resveratrol und co'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ja die klassischen NEMs (z.B. Vitamine, Eisen, Kurkuma)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Unregelmäßig nehme ich NEMs zu mir (zB wenn ich krank bin)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nein'),
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
                  lastIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (lastIndex != null) {
                      widget.uthUser.ass21Supplements = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment22Page(widget.uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Bitte treffen Sie eine Auswahl.")));
                    }
                  },
                  child: Text('Weiter'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    minimumSize:
                    MaterialStateProperty.all(Size(width / 1.2, width / 8)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

