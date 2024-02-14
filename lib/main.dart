import 'package:flutter/material.dart';
import 'package:flutter_automation/screens/sessions_screen.dart';
import './screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IntroScreen(),
        '/sessions': (context) => const SessionsScreen()
      },
      initialRoute: '/',
    );
  }
}
