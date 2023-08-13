import 'package:baby_cry/screens/auth/sign_in_screen.dart';
import 'package:baby_cry/screens/auth/sign_up_email_screen.dart';
import 'package:baby_cry/screens/home/home_screen.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class BabyCryApp extends StatelessWidget {
  const BabyCryApp({
    super.key,
    required this.isAmplifySuccessfullyConfigured,
  });
  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //app's routes
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(selectedIndex: 0),
        '/signIn': (context) => const SignInScreen(),
        '/signupEmail': (context) => const SignUpEmailScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Baby Cry',
      home: WelcomeScreen(),
    );
  }
}
