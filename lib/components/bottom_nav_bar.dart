import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hobby_picker/screens/add_screen.dart';
import 'package:hobby_picker/screens/home_screen.dart';
import 'package:hobby_picker/screens/view_screen/view_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ViewScreen(),
          AddScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: GNav(
            onTabChange: onTabTapped,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.shuffle_rounded,
                text: 'Shuffle',
              ),
              GButton(
                icon: Icons.view_headline_rounded,
                text: 'View',
              ),
              GButton(
                icon: Icons.add_circle_rounded,
                text: 'Add',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
