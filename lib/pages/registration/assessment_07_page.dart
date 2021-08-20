import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_08_page.dart';

class Assessment07Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment07Page(this.uthUser);
  @override
  _Assessment07PageState createState() => _Assessment07PageState();
}

class _Assessment07PageState extends State<Assessment07Page> {
  int lastIndex;
  List<bool> _selections = List.generate(4, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Brillenträger";
    }
    if (index == 1) {
      return "Kontaktlinsen";
    }
    if (index == 2) {
      return "Schlechteres Sehvermögen";
    }
    if (index == 3) {
      return "Perfektes Sehvermögen";
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
          AssessmentTitle('Hast du eine Sehhilfe?'),
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
                  child: Text('Ja ich bin eine Brillenschlange'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ja ich trage Kontaktlinsen'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nein aber ich sehe etwas schlechter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nein ich sehe perfekt'),
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
                      widget.uthUser.ass07Visionaid = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment08Page(widget.uthUser)));
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

