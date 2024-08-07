import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/add_activity.dart';

class ActivityDetailPage extends StatefulWidget {
  final String title;
  final String location;
  final String time;
  final IconData icon;
  final Color color;
  final String tripTitle;
  final String tripImagePath;

  const ActivityDetailPage(
      {Key? key,
      required this.title,
      required this.location,
      required this.time,
      required this.icon,
      required this.color,
      required this.tripTitle,
      required this.tripImagePath})
      : super(key: key);

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 12,
                      height: 24,
                      child: SvgPicture.asset('lib/images/recommend/back.svg'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Activity Detail',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _detailCard(
                  widget.color, widget.title, widget.location, widget.time),
              const Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50, // Adjust height as needed
                      width: 300, // Adjust width as needed
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3485FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Adjust border radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddActivity(
                                      tripTitle: widget.tripTitle,
                                      tripImagePath: widget.tripImagePath,
                                    )),
                          );
                        },
                        child: Text(
                          'Create Split Bill',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18, // Adjust font size as needed
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          softWrap: false,
                          overflow: TextOverflow
                              .ellipsis, // Prevents the text from breaking
                        ),
                      ),
                    ),
                    // make a button that consists of a circle button
                    Container(
                      height: 50, // Adjust height as needed
                      width: 50, // Adjust width as needed
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF3485FF),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'lib/images/activity_detail/edit.svg',
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddActivity(
                                      tripTitle: widget.tripTitle,
                                      tripImagePath: widget.tripImagePath,
                                    )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailCard(Color color, String title, String location, String time) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 2), // Add offset to the shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 320,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Center(
                        child: SvgPicture.asset(
                          'lib/images/dashboard/time.svg', // Update this path to your time SVG asset
                          width: 15,
                          height: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Colors.black, // Customize the color
                    thickness: 1, // Customize the thickness
                    indent: 0, // Customize the indent
                    endIndent: 5, // Customize the end indent
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• $location (makan siang)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '   Recommend menu: \n   claypot ayam siram telur mentah, cah\n   fumak,bakso goreng',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '• Histeria (thrift kaset)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '• Kopi tuku (kopi susu tetangga)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '• Papaya (salmon sashimi, mochi)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Baliknya pake mrt Blok M ke mrt Bundaran HI !!',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
