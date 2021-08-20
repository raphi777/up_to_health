import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_09_page.dart';

class Assessment08Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment08Page(this.uthUser);
  @override
  _Assessment08PageState createState() => _Assessment08PageState();
}

class _Assessment08PageState extends State<Assessment08Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Sehr gesund";
    }
    if (index == 1) {
      return "Ausgewogen";
    }
    if (index == 2) {
      return "Mal so mal so";
    }
    if (index == 3) {
      return "Ungesund";
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
          AssessmentTitle('Wie ernährst du dich?'),
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
                  child: Text('Sehr gesund (viel Obst & Gemüse, wenig tierische Proteine)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ausgewogen (Viel Gemüse aber auch ab und an mal ein Steak)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Mal so mal so (hin und wieder Fast-food aber auch ab und an Gesundes)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ungesund (Selten Gemüse, viel Fettiges, viele Süßigkeiten)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ich achte nicht darauf'),
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
                      widget.uthUser.ass08Nutrition = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment09Page(widget.uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Bitte treffen Sie eine Auswahl.")));
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

