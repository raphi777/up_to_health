import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class AssessmentInputFieldPassword extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.2,
      height: width / 8,
      child: PasswordField(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        controller: passwordController,
        hintText: "Password",
        pattern: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
        errorMessage:
        "Password must have a minimum of eight characters, at least one letter\nand one number!",
      ),
    );
  }
}
