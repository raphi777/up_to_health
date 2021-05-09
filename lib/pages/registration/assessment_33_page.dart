import 'package:flutter/material.dart';
import 'package:up_to_health/pages/home/home_page.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/button_continue.dart';

class Assessment33Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wähle bitte ein Passwort aus'),
          ButtonContinue(HomePage()),
        ],
      ),
    );
  }
}
