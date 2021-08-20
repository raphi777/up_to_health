import 'package:flutter/material.dart';

class AssessmentInputFieldNumeric extends StatelessWidget {
  AssessmentInputFieldNumeric(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.2,
      height: width / 8,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: label,
        ),
      ),
    );
  }
}