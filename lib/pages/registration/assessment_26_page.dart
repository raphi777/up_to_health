import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_27_page.dart';

class Assessment26Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment26Page(this.uthUser);
  @override
  _Assessment26PageState createState() => _Assessment26PageState();
}

class _Assessment26PageState extends State<Assessment26Page> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  int lastIndex;
  List<bool> _selections = List.generate(2, (_) => false);

  bool _dateIsValid(context, int year, int month) {
    // check if date is valid
    if (year > DateTime.now().year) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Angabe kann nicht in der Zukunft liegen.")));
      return false;
    }
    if (month > 12) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Angabe kann nicht in der Zukunft liegen.")));
      return false;
    }
    if (year == DateTime.now().year && month > DateTime.now().month) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Angabe kann nicht in der Zukunft liegen.")));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wann war dein letzter Besuch beim Zahnarzt?'),
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
                  child: Text('Zum unten angegebenen Zeitpunkt'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Weiß ich nicht'),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _selections.length;
                      buttonIndex++) {
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
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: TextField(
                    controller: monthController,
                    maxLength: 2,
                    decoration: InputDecoration(
                      labelText: "MM",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                new Flexible(
                  child: Text("/"),
                ),
                new Flexible(
                  child: TextField(
                    controller: yearController,
                    maxLength: 4,
                    decoration: InputDecoration(
                      labelText: "YYYY",
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (yearController.text.isNotEmpty &&
                        monthController.text.isNotEmpty &&
                        dayController.text.isNotEmpty) {
                      if (_dateIsValid(
                          context,
                          int.parse(yearController.text),
                          int.parse(monthController.text),)) {
                        widget.uthUser.ass03Birthday = new DateTime(
                            int.parse(yearController.text),
                            int.parse(monthController.text),
                            int.parse(dayController.text));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Assessment27Page(widget.uthUser)));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Bitte vollständiges Geburtsdatum angeben.")));
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
