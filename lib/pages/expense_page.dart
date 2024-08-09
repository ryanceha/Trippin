import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/add_activity.dart';

class ExpensePage extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const ExpensePage(
      {Key? key, required this.tripTitle, required this.tripImagePath});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String _selectedSorted = "Category"; // Default selected date

  final Map<String, List<Map<String, dynamic>>> expenses = {
    "Category": [
      {
        "title": "Gucci Bag",
        "location": "Sarinah",
        "date": "20 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 5.600.000"
      },
      {
        "title": "Shopping Supree",
        "location": "Plaza Senayan",
        "date": "21 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 10.200.000"
      },
      {
        "title": "Makan Siang",
        "location": "Claypot Popo",
        "date": "17 Agustus 2024",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 240.000"
      },
      {
        "title": "LUCA Ice Cream",
        "location": "Taman Anggrek",
        "date": "20 September 2022",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 12.000"
      },
      {
        "title": "Makan Malam",
        "location": "Osteria",
        "date": "30 September 1998",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 180.000"
      },
      {
        "title": "Timezone",
        "location": "Tunjungan",
        "date": "17 Agustus 1945",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 300.000"
      },
    ],
    "Days": [
      {
        "title": "Makan Siang",
        "location": "Claypot Popo",
        "date": "17 Agustus 2024",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 240.000"
      },
      {
        "title": "LUCA Ice Cream",
        "location": "Taman Anggrek",
        "date": "20 September 2022",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 12.000"
      },
      {
        "title": "Gucci Bag",
        "location": "Sarinah",
        "date": "20 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 5.600.000"
      },
      {
        "title": "Shopping Supree",
        "location": "Plaza Senayan",
        "date": "21 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 10.200.000"
      },
      {
        "title": "Makan Malam",
        "location": "Osteria",
        "date": "30 September 1998",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 180.000"
      },
      {
        "title": "datezone",
        "location": "Tunjungan",
        "date": "17 Agustus 1945",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 300.000"
      },
    ],
    "Highest Price": [
      {
        "title": "Shopping Supree",
        "location": "Plaza Senayan",
        "date": "21 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 10.200.000"
      },
      {
        "title": "Gucci Bag",
        "location": "Sarinah",
        "date": "20 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 5.600.000"
      },
      {
        "title": "dateZone",
        "location": "Tunjungan",
        "date": "17 Agustus 1945",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 300.000"
      },
      {
        "title": "Makan Siang",
        "location": "Claypot Popo",
        "date": "17 Agustus 2024",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 240.000"
      },
      {
        "title": "Makan Malam",
        "location": "Osteria",
        "date": "30 September 1998",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 180.000"
      },
      {
        "title": "LUCA Ice Cream",
        "location": "Taman Anggrek",
        "date": "20 September 2022",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 12.000"
      },
    ],
    "Lowest Price": [
      {
        "title": "LUCA Ice Cream",
        "location": "Taman Anggrek",
        "date": "20 September 2022",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 12.000"
      },
      {
        "title": "Makan Malam",
        "location": "Osteria",
        "date": "30 September 1998",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 180.000"
      },
      {
        "title": "Makan Siang",
        "location": "Claypot Popo",
        "date": "17 Agustus 2024",
        "icon": Icons.restaurant,
        "color": Color(0xFF47712D),
        "price": "Rp. 240.000"
      },
      {
        "title": "datezone",
        "location": "Tunjungan",
        "date": "17 Agustus 1945",
        "icon": Icons.dinner_dining,
        "color": Color(0xFFE2305F),
        "price": "Rp. 300.000"
      },
      {
        "title": "Gucci Bag",
        "location": "Sarinah",
        "date": "20 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 5.600.000"
      },
      {
        "title": "Shopping Supree",
        "location": "Plaza Senayan",
        "date": "21 Mei 2024",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEFB949),
        "price": "Rp. 10.200.000"
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
              'Expense',
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
          children: [
            const SizedBox(height: 16),
            Container(
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFE93636),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your Total Expense",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Inter'),
                  ),
                  Text(
                    "Rp 16.532.000",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Sort by : ",
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 12, color: Colors.black),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final category in expenses.keys)
                          _buildMenuButton(category),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _buildExpenseCards(_selectedSorted),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddActivity(
                        tripTitle: widget.tripTitle,
                        tripImagePath: widget.tripImagePath,
                      )));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Color(0xFF3485FF),
        child: SvgPicture.asset(
          'lib/images/expense/add.svg',
          color: Colors.white,
          width: 20,
          height: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildMenuButton(String category) {
    bool isSelected = _selectedSorted == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSorted = category;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF9C9C9C).withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            color: isSelected
                ? Color(0xFF3485FF)
                : Colors.white, // Dark blue for selected
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF3485FF),
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpenseCards(String category) {
    List<Map<String, dynamic>>? categoryExpenses = expenses[category];
    if (categoryExpenses == null) return [];

    return categoryExpenses.map((expense) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        child: _buildExpenseCard(
          title: expense['title'],
          location: expense['location'],
          date: expense['date'],
          icon: expense['icon'],
          color: expense['color'],
          price: expense['price'],
        ),
      );
    }).toList();
  }

  Widget _buildExpenseCard({
    required String title,
    required String location,
    String? time,
    String? date,
    required IconData icon,
    required Color color,
    required String price,
  }) {
    return Container(
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
        ),
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              icon,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(width: 6),
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
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.black,
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
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(width: 6),
                            Text(
                              time ?? date ?? "No time/date available",
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
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
