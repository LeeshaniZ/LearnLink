import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'task_screen.dart';
import 'study_groups_screen.dart';
import 'resource_screen.dart';
import 'motivation_screen.dart';

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TaskScreen(),
    StudyGroupsScreen(),
    ResourceScreen(),
    MotivationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Resources'),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Motivation',
          ),
        ],
      ),
    );
  }
}
