import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_input_field_numeric.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';
import 'assessment_06_page.dart';

class Assessment05Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wie viel wiegst du?'),
          AssessmentInputFieldNumeric('Gewicht in kg'),
          ButtonContinue(Assessment06Page()),
        ],
      ),
    );
  }
}
