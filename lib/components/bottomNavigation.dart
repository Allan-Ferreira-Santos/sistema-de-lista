import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/RegisterContacts');
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
