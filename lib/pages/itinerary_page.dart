import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/activity_detail_page.dart';
import 'package:trippin/pages/add_activity.dart';

class ItineraryPage extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const ItineraryPage(
      {Key? key, required this.tripTitle, required this.tripImagePath});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  String selectedDate = "19"; // Default selected date

  final Map<String, List<Map<String, dynamic>>> itineraries = {
    "19": [
      {
        "title": "Jalan-jalan + Belanja",
        "location": "Sarinah",
        "time": "11:00 - 12:00",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
      },
      {
        "title": "Makan Siang",
        "location": "Claypot Popo",
        "time": "12:00 - 13:00",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
      },
      {
        "title": "Makan Malam",
        "location": "Osteria",
        "time": "18:00 - 19:00",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
      },
      {
        "title": "Kuliner",
        "location": "Tunjungan",
        "time": "20:00 - 19:00",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
      },
    ],
    "20": [
      {
        "title": "Visit Museum",
        "location": "National Museum",
        "time": "10:00 - 12:00",
        "icon": Icons.museum,
        "color": Color(0xFF9C27B0),
      },
      {
        "title": "Lunch",
        "location": "Museum Cafe",
        "time": "12:00 - 13:00",
        "icon": Icons.restaurant,
        "color": Color(0xFF03A9F4),
      },
    ],
    // Add more itinerary data for other dates...
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // redirect to HomePage()
                Navigator.pop(context);
              },
              child: Container(
                width: 24,
                height: 24,
                child: SvgPicture.asset('lib/images/recommend/back.svg'),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Itinerary',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'September 19, 2024',
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3485FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 13, vertical: 2), // Adjust padding
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
                    "+ Add Itinerary",
                    style: TextStyle(
                      fontSize: 11, // Adjust font size
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDateCard("19", "SUN"),
                  _buildDateCard("20", "MON"),
                  _buildDateCard("21", "TUE"),
                  _buildDateCard("22", "WED"),
                  _buildDateCard("23", "THU"),
                  _buildDateCard("24", "FRI"),
                  _buildDateCard("25", "SAT"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0), // Adjust padding
                child: ListView(
                  children: [
                    ..._buildItineraryCards(selectedDate),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(String day, String weekday) {
    bool isSelected = selectedDate == day;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = day;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(10.0),
        width: 90, // Increased width
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF3485FF)
              : Colors.white, // Dark blue for selected
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              "SEP",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              weekday,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItineraryCards(String date) {
    List<Map<String, dynamic>>? itineraryForDate = itineraries[date];
    if (itineraryForDate == null) return [];

    return itineraryForDate.map((itinerary) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        child: _buildItineraryCard(
          title: itinerary['title'],
          location: itinerary['location'],
          time: itinerary['time'],
          icon: itinerary['icon'],
          color: itinerary['color'],
        ),
      );
    }).toList();
  }

  Widget _buildItineraryCard({
    required String title,
    required String location,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityDetailPage(
              tripTitle: widget.tripTitle,
              tripImagePath: widget.tripImagePath,
              title: title,
              location: location,
              time: time,
              icon: icon,
              color: color,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10), // Add top margin of 10 pixels
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2), // Add offset to the shadow
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 110,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Icon(
                            icon,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                            width:
                                6), // Add some spacing between the icon and text
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Center(
                          child: Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          location,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black), // Add a horizontal line
                    Row(
                      children: [
                        Center(
                          child: Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          time,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
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
      ),
    );
  }
}
