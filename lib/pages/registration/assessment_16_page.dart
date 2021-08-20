import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_17_page.dart';

class Assessment16Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment16Page(this.uthUser);
  @override
  _Assessment16PageState createState() => _Assessment16PageState();
}

class _Assessment16PageState extends State<Assessment16Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Überglücklich";
    }
    if (index == 1) {
      return "Nicht perfekt aber Glücksmomente";
    }
    if (index == 2) {
      return "Keine Gedanken gemacht, denke passt";
    }
    if (index == 3) {
      return "Selbstzweifel";
    }
    if (index == 4) {
      return "Unzufrieden";
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
                      widget.uthUser.ass16Physicalcondition = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment17Page(widget.uthUser)));
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

