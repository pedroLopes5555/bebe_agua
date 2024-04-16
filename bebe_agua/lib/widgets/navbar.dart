import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: const [
      NavigationDestination(icon: Icon(Icons.home), label: 'home'),
      NavigationDestination(icon: Icon(Icons.settings), label: 'settings')
    ]);
  }
}
