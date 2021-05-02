import 'package:flutter/material.dart';

class AssessmentTitle extends StatelessWidget {
  AssessmentTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 100, left: 10, right: 10, bottom: 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
