import 'package:flutter/material.dart';
import '../screens/intro_screen.dart';
import '../screens/sessions_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        key: const ValueKey('List View'),
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Sessions',
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.pink,
        shape: BoxShape.rectangle,
      ),
      key: ValueKey('Drawer Header'),
      child: Text(
        'Health Application',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
        key: ValueKey('Text Fitness App'),
      ),
    ));
    for (var e in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          e,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (e) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'Sessions':
              screen = const SessionsScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
        key: const ValueKey('List Titles'),
      ));
    }

    return menuItems;
  }
}
