import 'package:flutter/material.dart';

class AssessmentInputField extends StatelessWidget {
  AssessmentInputField(this.label, this.controller);
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.2,
      height: width / 8,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: label,
        ),
        controller: controller,
      ),
    );
  }
}
