import 'package:block_pe/screens/a.dart';
import 'package:block_pe/screens/b.dart';
import 'package:block_pe/screens/c.dart';
import 'package:block_pe/screens/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const A(),
    const B(),
    const C(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Builder(
        builder: (context) {
          return NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.book_outlined),
                selectedIcon: Icon(Icons.book),
                label: 'A',
              ),
              NavigationDestination(
                icon: Icon(Icons.comment_bank_outlined),
                selectedIcon: Icon(Icons.comment_bank),
                label: 'B',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_outlined),
                selectedIcon: Icon(Icons.bookmark),
                label: 'C',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_outlined),
                selectedIcon: Icon(Icons.person_2),
                label: 'D',
              ),
            ],
          );
        },
      ),
    );
  }
}
