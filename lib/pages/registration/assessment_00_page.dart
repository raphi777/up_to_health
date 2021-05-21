import 'package:flutter/material.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/button_continue.dart';

import 'assessment_01_page.dart';

class Assessment00Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 10, right: 10, bottom: 10),
              child: Text(
                'Willkommen bei UpToHealth! Du bist fast startbereit',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Text(
                'Um dir auf deine persönliche Situation maßgeschneiderte Informationen und Tipps anbieten zu können, benötigen wir von dir vorab lediglich ein paar wichtige Angaben zu dir und deinem Lebensstil.',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ButtonContinue(Assessment01Page(new UthUser())),
        ],
      ),
    );
  }
}
