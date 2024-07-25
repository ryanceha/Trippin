import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF5FB),
      body: Stack(
        children: [
          // Placeholder for content based on the selected index
          Center(
            child: Text('Selected Index: $_currentIndex'),
          ),
          // Custom background container based on selected index
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color:
                    _currentIndex == 1 ? Color(0xFF3485FF) : Color(0xFFEEF5FB),
              ),
            ),
          ),
          // CurvedNavigationBar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              backgroundColor: Color(0xFFEEF5FB),
              index: _currentIndex,
              height: 50,
              items: [
                Icon(Icons.photo_outlined,
                    color: _currentIndex == 0 ? Colors.white : Colors.black),
                Icon(Icons.add_rounded,
                    color: _currentIndex == 1 ? Colors.white : Colors.black),
                Icon(Icons.account_circle,
                    color: _currentIndex == 2 ? Colors.white : Colors.black),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index; // Update the current index on tap
                });
              },
              animationDuration: Duration(milliseconds: 300),
              color: Colors.white, // Color of selected item
              buttonBackgroundColor:
                  Color(0xFF3485FF), // Background color of items
            ),
          ),
        ],
      ),
    );
  }
}
