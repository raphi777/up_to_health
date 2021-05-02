import 'package:flutter/material.dart';
import 'package:up_to_health/pages/registration/assessment_02_page.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_input_filed.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';

class Assessment01Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie heißt du?'),
          AssessmentInputField('Vorname'),
          ButtonContinue(Assessment02Page()),
        ],
      ),
    );
  }
}
