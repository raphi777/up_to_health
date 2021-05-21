import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';

import 'assessment_04_page.dart';

class Assessment03Page extends StatelessWidget {
  final UthUser uthUser;

  Assessment03Page(this.uthUser);

  bool _birthdayIsValid(context, int year, int month, int day) {
    // check if user is at least 16 years old
    if (year < 1900) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ungültiges Jahr.")));
      return false;
    }
    if (month > 12) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ungültiger Monat.")));
      return false;
    }
    if (day > 31) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ungültiger Tag.")));
      return false;
    }

    DateTime birthday = new DateTime(year, month, day);
    if (DateTime.now().difference(birthday).inDays > 4380) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sie müssen mindestens 12 Jahre alt sein.")));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final TextEditingController dayController = TextEditingController();
    final TextEditingController monthController = TextEditingController();
    final TextEditingController yearController = TextEditingController();

    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wann hast du Geburtstag ?'),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: TextField(
                    controller: dayController,
                    maxLength: 2,
                    decoration: InputDecoration(
                      labelText: "DD",
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
                      if (_birthdayIsValid(
                          context,
                          int.parse(yearController.text),
                          int.parse(monthController.text),
                          int.parse(dayController.text))) {
                        uthUser.ass03Birthday = new DateTime(
                            int.parse(yearController.text),
                            int.parse(monthController.text),
                            int.parse(dayController.text));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Assessment04Page(uthUser)));
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
