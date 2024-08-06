import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillingPage extends StatefulWidget {
  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  bool isDoneSelected = false;

  final List<Map<String, dynamic>> itineraries = [
    {
      "title": "Tiket Masuk",
      "location": "Sarinah",
      "date": "27/05/2024 11:11",
      "amountOwed": "You owe Daniel IDR 150,000",
      "itemsPersons": "10 items · 10 persons",
      "icon": Icons.shopping_bag,
      "color": Color(0xFFEFB949),
      "userImages": [
        'lib/images/split_billing/aryo.png',
        'lib/images/split_billing/ruth.png',
        'lib/images/split_billing/grace.png',
      ],
    },
    // Add other itineraries here...
  ];

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
                Navigator.pop(context);
              },
              child: Container(
                width: 12,
                height: 24,
                child: SvgPicture.asset('lib/images/recommend/back.svg'),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Billing',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your action for adding bills here
                    },
                    child: Container(
                      width: 70,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFF3485FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            '+ Add Bills',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFE93636),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/images/billing/bill.png',
                            width: 40,
                            height: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              'How Much I Owe Others',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'IDR 150,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Active Bills',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 250,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF47712D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/images/billing/bill2.png',
                            width: 40,
                            height: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40.0),
                            child: Text(
                              'How Much Others Owe Me',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'IDR 150,000',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Active Bills',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing before the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDoneSelected = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            isDoneSelected ? Colors.white : Color(0xFF3485FF),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.5), // Warna shadow dengan opacity
                            spreadRadius: 2, // Sebaran shadow
                            blurRadius: 5, // Buram shadow
                            offset: Offset(0, 3), // Posisi shadow (x, y)
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Active',
                          style: TextStyle(
                            color: isDoneSelected
                                ? Color(0xFF3485FF)
                                : Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDoneSelected = true;
                      });
                    },
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color:
                            isDoneSelected ? Color(0xFF3485FF) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.5), // Warna shadow dengan opacity
                            spreadRadius: 2, // Sebaran shadow
                            blurRadius: 5, // Buram shadow
                            offset: Offset(0, 3), // Posisi shadow (x, y)
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: isDoneSelected
                                ? Colors.white
                                : Color(0xFF3485FF),
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ..._buildItineraryCards(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItineraryCards() {
    return itineraries.map((itinerary) {
      return _buildItineraryCard(
        title: itinerary['title'],
        date: itinerary['date'],
        amountOwed: itinerary['amountOwed'],
        itemsPersons: itinerary['itemsPersons'],
        color: itinerary['color'],
        userImages: itinerary['userImages'],
      );
    }).toList();
  }

  Widget _buildItineraryCard({
    required String title,
    required String date,
    required String amountOwed,
    required String itemsPersons,
    required Color color,
    required List<String> userImages, // List of user image URLs
  }) {
    return GestureDetector(
      onTap: () {
        // You may need to pass the context here
        // to use Navigator.push inside a StatelessWidget
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16.0, right: 10.0),
        // padding: const EdgeInsets.only(
        //     top: 15.0, left: 15.0, right: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 2), // Add offset to the shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 10,
              decoration: BoxDecoration(
                color: Color(0xFF3485FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 5.0, right: 15.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Row(
                          children: userImages.map((imageUrl) {
                            return Container(
                              margin: const EdgeInsets.only(left: 4.0),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(imageUrl),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      amountOwed,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                    Text(
                      itemsPersons,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan aksi untuk tombol "details" di sini
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3485FF),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                        ),
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
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

// void main() {
//   runApp(MaterialApp(
//     home: BillingPage(),
//   ));
// }