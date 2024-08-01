import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trippin/pages/add_trip_page.dart';
import 'package:trippin/pages/dashboard_page.dart';
import 'package:trippin/pages/recommend_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  bool _isAddButtonSelected = true;
  bool _showBottomDrawer = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF5FB),
      body: Stack(
        children: [
          // Logo and Text
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/home/logo_wrn.png', // Pastikan path gambar benar
                  height: 50,
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.only(top: 10), // Margin top 10px
                  child: Text(
                    'My Trip',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40,
                      fontWeight: FontWeight.w800, // Extra Bold
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Cover Image
          Positioned(
            top: 120, // Adjust top position as needed
            left: 20,
            right: 20,
            child: Container(
              height: 450, // Sesuaikan ukuran height di sini
              child: PageView(
                controller: _pageController,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                      );
                    },
                    child: Image.asset(
                      'lib/images/home/cover.png', // Path to your uploaded image
                      // fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                      );
                    },
                    child: Image.asset(
                      'lib/images/home/cover2.png', // Path to your second image
                      // fit: BoxFit.cover,
                    ),
                  ),
                  // Add more images as needed with GestureDetector
                ],
              ),
            ),
          ),
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
                            // Handle Recommended button press
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecommendPage()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTripPage()));
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
          // Button that links to dashboard page
          // Positioned(
          //   top: 50,
          //   right: 20,
          //   child: Container(
          //     margin: EdgeInsets.only(top: 40),
          //     child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => DashboardPage()),
          //         );
          //       },
          //       child: Text('Dashboard'),
          //     ),
          //   ),
          // ),
          // Center(
          //   child: Text('Selected Index: $_currentIndex'),
          // ),
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
              animationDuration: Duration(milliseconds: 200),
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
