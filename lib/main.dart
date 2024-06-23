import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'forgotten_password.dart';
import 'login.dart';
import 'signup.dart';
import 'sort_delete.dart';
import 'training_new.dart';
import 'training_page.dart';
import 'welcomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        hintColor: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/welcome': (context) => const WelcomePage(),
        '/train': (context) => const TrainPage(),
        '/eegData': (context) => const EEGDataPage(),
        '/resetPassword': (context) => const ResetPasswordPage(),
        '/trainNew': (context) => const TrainNewPage(),
      },
    );
  }
}
