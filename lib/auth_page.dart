import 'package:eeg_application/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Handle the case when the authentication state is still loading
            return const CircularProgressIndicator(); // or any other loading indicator
          }
          if (snapshot.hasData && snapshot.data != null) {
            // If user is authenticated, navigate to the welcome page
            return const WelcomePage();
          } else {
            // If user is not authenticated, show the login page
            return const LoginPage();
          }
        },
      ),
    );
  }
}
