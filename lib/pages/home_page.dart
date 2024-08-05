import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trippin/pages/dashboard_page.dart';

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

  CarouselController _carouselController = new CarouselController();

  int _current = 0;

  List<dynamic> _cards = [
    {'text': 'Bali, 2024', 'image': 'lib/images/home/bali.png'},
    {'text': 'Surabaya, 2024', 'image': 'lib/images/home/surabaya.png'},
    {'text': 'France, 2027', 'image': 'lib/images/home/france.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF5FB),
      body: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Update background image based on carousel's current slide
            Image.asset(
              _cards[_current]['image'], // Use the current image
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/images/home/logo_white.svg',
                    height: 50,
                    width: 42,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Container(
                    margin: EdgeInsets.only(top: 10), // Margin top 10px
                    child: Text(
                      'My Trip',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40,
                        fontWeight: FontWeight.w800, // Extra Bold
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFEEF5FB).withOpacity(1),
                      Color(0xFFEEF5FB).withOpacity(1),
                      Color(0xFFEEF5FB).withOpacity(1),
                      Color(0xFFEEF5FB).withOpacity(1),
                      Color(0xFFEEF5FB).withOpacity(0),
                      Color(0xFFEEF5FB).withOpacity(0),
                      Color(0xFFEEF5FB).withOpacity(0),
                      Color(0xFFEEF5FB).withOpacity(0),
                      Color(0xFFEEF5FB).withOpacity(0),
                      Color(0xFFEEF5FB).withOpacity(0)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 450,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: _cards.map((card) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          print(card['text']
                              .runtimeType); // Should print 'String'
                          print(card['image']
                              .runtimeType); // Should print 'String'
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardPage(
                                  // This should also be a String
                                  ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Stack(
                              children: [
                                // Image covers the area within the padding
                                Image.asset(
                                  card['image'],
                                  fit: BoxFit.cover,
                                  width: 500,
                                  height: double.infinity,
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      card['text'],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            // Curved Navigation Bar
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
