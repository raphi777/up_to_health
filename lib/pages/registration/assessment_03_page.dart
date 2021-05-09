import 'package:flutter/material.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:up_to_health/widgets/birthday_picker.dart';
import 'package:up_to_health/widgets/button_continue.dart';

import 'assessment_04_page.dart';

class Assessment03Page extends StatelessWidget {
  bool _birthdayIsValid(context, int year, int month, int day) {
    // check if user is at least 16 years old
    if (year < 1900) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Year.")));
      return false;
    }
    if (month > 12) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Month.")));
      return false;
    }
    if (day > 31) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Day.")));
      return false;
    }

    DateTime birthday = new DateTime(year, month, day);
    if (DateTime.now().difference(birthday).inDays > 5840) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Users must me at least 16 years old.")));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Wann hast du Geburtstag ?'),
          BirthdayPicker(),
          ButtonContinue(Assessment04Page()),
        ],
      ),
    );
  }
}
