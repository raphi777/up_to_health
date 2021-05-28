import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:up_to_health/authentication/add_user.dart';
import 'package:up_to_health/authentication/authentication_service.dart';
import 'package:up_to_health/authentication/authentication_widget.dart';
import 'package:up_to_health/data/uth_user.dart';
import 'package:up_to_health/pages/registration/assessment_01_page.dart';
import 'package:up_to_health/widgets/app_bar_default.dart';
import 'package:up_to_health/widgets/assessment_title.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Assessment32Page extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UthUser uthUser;

  Assessment32Page(this.uthUser);

  Future<bool> signUp() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await AuthenticationService(_firebaseAuth).signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDefault(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AssessmentTitle('Gib deine E-Mail Adresse an und wähle ein Passwort'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'E-Mail',
              ),
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      uthUser.email = emailController.text.trim();
                      context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                        //Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Assessment01Page(uthUser)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter E-Mail and Password.")));
                    }
                  },
                  child: Text('Weiter'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(width / 1.2, width / 8)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
