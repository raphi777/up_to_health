import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'assessment_13_page.dart';

class Assessment12Page extends StatefulWidget {
  final UthUser uthUser;

  Assessment12Page(this.uthUser);

  @override
  _Assessment12PageState createState() => _Assessment12PageState();
}

class _Assessment12PageState extends State<Assessment12Page> {
  String dropdownValue = 'Bau';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle(
              'In welcher Branche arbeitest du bzw. stehst du erst noch vor deinem Start ins Berufsleben?'),
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
            items: <String>[
              'Bau',
              'Bildung & Erziehung',
              'Buchhaltung',
              'Chemie & Pharma',
              'Design & Architektur',
              'Dienstleistungen',
              'Einzelhandel',
              'Finanzen',
              'Gastronomie',
              'Gesundheitswesen',
              'Handwerk',
              'Immobilien',
              'Industrie & Produktion',
              'Ingenieurwesen',
              'IT',
              'Investment Banking',
              'Kundendienst',
              'Kunst',
              'Landwirtschaft',
              'Marketing',
              'Mechanik & Maschinenbau',
              'Medien & Verlagswesen',
              'Personalwesen',
              'Recht',
              'Sicherheit',
              'Soziale Berufe',
              'Tourismus & Hotellerie',
              'Transport & Logistik',
              'Unternehmensberatung',
              'Versicherung',
              'Vertrieb & Verkauf',
              'Verwaltung',
              'Wissenschaft',
              'Im Studium',
              'In der Schule',
              'In der Ausbildung',
              'Sonstige'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (dropdownValue.isNotEmpty) {
                      widget.uthUser.ass12Industry = dropdownValue;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Assessment13Page(widget.uthUser)));
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
