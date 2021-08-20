import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_03_page.dart';

class Assessment02Page extends StatefulWidget {
  @override
  _Assessment02PageState createState() => _Assessment02PageState();
  final UthUser uthUser;
  Assessment02Page(this.uthUser);
}

class _Assessment02PageState extends State<Assessment02Page> {
  int lastIndex;
  List<bool> _selections = List.generate(3, (_) => false);

  String _getGender(int index) {
    if (index == 0) {
      return "FEMALE";
    }
    if (index == 1) {
      return "MALE";
    }
    if (index == 2) {
      return "NOT SPECIFIED";
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
          AssessmentTitle('Welches Geschlecht hast du ?'),
          ToggleButtons(
            direction: Axis.vertical,
            constraints: BoxConstraints(minWidth: 150, minHeight: 40),
            renderBorder: true,
            borderRadius: BorderRadius.circular(30),
            borderWidth: 5,
            children: [
              Text('Weiblich'),
              Text('Männlich'),
              Text('Möchte ich nicht sagen'),
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
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (lastIndex != null) {
                      widget.uthUser.ass02Gender = _getGender(lastIndex);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Assessment03Page(widget.uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Bitte Geschlecht eingeben oder 'Möchte ich nicht sagen' wählen.")));
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
