import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';

import 'assessment_04_page.dart';

class Assessment03Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wann hast du Geburtstag ?'),
          ButtonContinue(Assessment04Page()),
        ],
      ),
    );
  }
}
