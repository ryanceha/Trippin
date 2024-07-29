import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trippin/pages/dashboard_page.dart';
import 'package:trippin/pages/recommend/time_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  // karena dari awal defaultnya di index = 1 which is add button
  bool _isAddButtonSelected = true;
  bool _showBottomDrawer = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleDrawer() {
    setState(() {
      _showBottomDrawer = !_showBottomDrawer;
      if (_showBottomDrawer) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF5FB),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 0 + (_animation.value * 106),
                  width: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFF3485FF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 16, right: 16, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecommendedTimePage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                          ),
                          child: Text('Recommended'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle New button press
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 50.0),
                          ),
                          child: Text('New'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // make a button that links to dashboard page
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Dashboard'),
            ),
          ),
          Center(
            child: Text('Selected Index: $_currentIndex'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
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
                if (index == 1) {
                  if (_isAddButtonSelected) {
                    _toggleDrawer();
                  }
                  setState(() {
                    _isAddButtonSelected = true;
                  });
                  _currentIndex = index;
                } else {
                  setState(() {
                    _currentIndex = index;
                    _isAddButtonSelected = false;
                  });
                  if (_showBottomDrawer) {
                    _toggleDrawer();
                  }
                }
              },
              animationDuration: Duration(milliseconds: 400),
              color: Colors.white,
              buttonBackgroundColor: Color(0xFF3485FF),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
