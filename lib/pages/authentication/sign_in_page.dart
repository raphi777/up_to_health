import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:up_to_health/authentication/authentication_service.dart';
import 'package:up_to_health/pages/registration/splash_screen_page.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
    final signInResult = await context.read<AuthenticationService>().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(signInResult.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordField(
              controller: passwordController,
              hintText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _signIn(context, emailController, passwordController);
            },
            child: Text("Sign in"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPage())),
            child: Text("Go to Register"),
          )
        ],
      ),
    );
  }
}