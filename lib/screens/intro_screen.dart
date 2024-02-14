import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Application'),
        key: const ValueKey('Heading Fitness Application'),
      ),
      key: const ValueKey('Screen Introduction'),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Center(
        child: Text(
          'Intro Screen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal.withOpacity(0.5),
              fontSize: 20),
          key: const ValueKey('Text Intro Screen'),
        ),
      ),
    );
  }
}
