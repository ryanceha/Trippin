import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/add_trip_page.dart';
import 'package:trippin/pages/dashboard_page.dart';
import 'package:trippin/pages/profile_page.dart';
import 'package:trippin/pages/gallery_page.dart';
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

  CarouselController _carouselController = CarouselController();
  int _current = 0;

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

  final List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    _pages.addAll([
      GalleryPage(),
      MainPage(
        carouselController: _carouselController,
        current: _current,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      ProfilePage(),
    ]);

    return Scaffold(
      backgroundColor: Color(0xFFEEF5FB),
      body: Stack(
        children: [
          _pages[_currentIndex],
          if (_currentIndex == 1)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    height: _animation.value * 106,
                    width: MediaQuery.of(context).size.width,
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

class MainPage extends StatefulWidget {
  final CarouselController carouselController;
  final int current;
  final Function(int) onPageChanged;

  MainPage({
    required this.carouselController,
    required this.current,
    required this.onPageChanged,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    current = widget.current;
  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.current != widget.current) {
      setState(() {
        current = widget.current;
      });
    }
  }

  final List<dynamic> cards = [
    {'text': 'Bali, 2024', 'image': 'lib/images/home/bali.png'},
    {'text': 'Surabaya, 2024', 'image': 'lib/images/home/surabaya.png'},
    {'text': 'France, 2027', 'image': 'lib/images/home/france.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          cards[current]['image'],
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
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'My Trip',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
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
          bottom: 100,
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            carouselController: widget.carouselController,
            options: CarouselOptions(
              height: 450,
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                  widget.onPageChanged(index);
                });
              },
            ),
            items: cards.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        _createRoute(card),
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
      ],
    );
  }

  Route _createRoute(Map<String, String> card) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DashboardPage(
        tripTitle: card['text']!,
        tripImagePath: card['image']!,
      ),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
