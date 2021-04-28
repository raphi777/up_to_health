import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_to_health/pages/authentication/sign_in_page.dart';
import 'package:up_to_health/pages/home/home_page.dart';
import 'authentication_service.dart';

class AuthenticationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context, listen:false);
    return StreamBuilder<User>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user != null ? HomePage() : SignInPage();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('TiWoPi'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}