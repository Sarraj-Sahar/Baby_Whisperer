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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby Cry',
      home: WelcomeScreen(),
    );
  }
}
