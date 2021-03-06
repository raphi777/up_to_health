import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_18_page.dart';

class Assessment17Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment17Page(this.uthUser);
  @override
  _Assessment17PageState createState() => _Assessment17PageState();
}

class _Assessment17PageState extends State<Assessment17Page> {
  int lastIndex;
  List<bool> _selections = List.generate(5, (_) => false);

  String _getSelection(int index) {
    if (index == 0) {
      return "Mehr als 4 Stunden";
    }
    if (index == 1) {
      return "Zwischen 2 und 4 Stunden";
    }
    if (index == 2) {
      return "Zwischen 1 und 2 Stunden";
    }
    if (index == 3) {
      return "Weniger als eine Stunde";
    }
    if (index == 4) {
      return "So gut wie gar nicht";
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
                  child: Text('Wei?? ich nicht / so gut wie gar nicht'),
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
                      widget.uthUser.ass17Outdoors = _getSelection(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment18Page(widget.uthUser)));
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

