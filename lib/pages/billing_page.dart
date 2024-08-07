import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/billing_detail_page.dart';
import 'package:trippin/pages/dashboard_page.dart';
import 'package:trippin/pages/scan_bill_page.dart';

class BillingPage extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const BillingPage(
      {Key? key, required this.tripTitle, required this.tripImagePath});

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
        'lib/images/split_billing/ryan.png',
      ],
      "status": "active",
    },
    {
      "title": "Makan Malam",
      "location": "Restoran ABC",
      "date": "28/05/2024 19:30",
      "amountOwed": "You owe Sarah IDR 200,000",
      "itemsPersons": "8 items · 4 persons",
      "icon": Icons.restaurant,
      "color": Color(0xFF76C7C0),
      "userImages": [
        'lib/images/split_billing/sarah.png',
        'lib/images/split_billing/ryan.png',
      ],
      "status": "done",
    },
    {
      "title": "Hotel Menginap",
      "location": "Hotel XYZ",
      "date": "29/05/2024 15:00",
      "amountOwed": "You owe Michael IDR 500,000",
      "itemsPersons": "1 item · 2 persons",
      "icon": Icons.hotel,
      "color": Color(0xFF6D28D9),
      "userImages": [
        'lib/images/split_billing/michael.png',
      ],
      "status": "active",
    },
    {
      "title": "Transportasi",
      "location": "Taksi",
      "date": "30/05/2024 09:00",
      "amountOwed": "You owe Anna IDR 75,000",
      "itemsPersons": "2 items · 2 persons",
      "icon": Icons.directions_car,
      "color": Color(0xFFFF6F61),
      "userImages": [
        'lib/images/split_billing/anna.png',
        'lib/images/split_billing/john.png',
      ],
      "status": "done",
    },
    {
      "title": "Souvenir",
      "location": "Toko Oleh-Oleh",
      "date": "31/05/2024 10:00",
      "amountOwed": "You owe Jessica IDR 120,000",
      "itemsPersons": "5 items · 3 persons",
      "icon": Icons.shopping_bag,
      "color": Color(0xFFFFB300),
      "userImages": [
        'lib/images/split_billing/jessica.png',
        'lib/images/split_billing/leo.png',
      ],
      "status": "active",
    },
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
                // redirect to HomePage()
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardPage(
                              tripTitle: widget.tripTitle,
                              tripImagePath: widget.tripImagePath,
                            )));
              },
              child: Container(
                width: 12,
                height: 24,
                child: SvgPicture.asset('lib/images/recommend/back.svg'),
              ),
            ),
            const SizedBox(width: 20),
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScanBillPage(
                                  tripTitle: widget.tripTitle,
                                  tripImagePath: widget.tripImagePath,
                                )),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Color(0xFF3485FF),
                        borderRadius: BorderRadius.circular(30),
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
                      borderRadius: BorderRadius.circular(30),
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
                      borderRadius: BorderRadius.circular(30),
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
            const SizedBox(height: 20),
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
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
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
                            fontSize: 16,
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
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
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
                            fontSize: 16,
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
              children: _buildItineraryCards(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItineraryCards() {
    List<Map<String, dynamic>> filteredItineraries =
        itineraries.where((itinerary) {
      return isDoneSelected
          ? itinerary['status'] == 'done'
          : itinerary['status'] == 'active';
    }).toList();

    print(
        'Filtered Itineraries: ${filteredItineraries.length}'); // Debugging statement

    return filteredItineraries.map((itinerary) {
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
    required List<String> userImages,
  }) {
    return GestureDetector(
      onTap: () {
        // Add your action for card tap here
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16.0, right: 10.0),
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
              height: 170,
              width: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                            fontSize: 20,
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
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      amountOwed,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemsPersons,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BillingDetail(
                                            tripTitle: widget.tripTitle,
                                            tripImagePath: widget.tripImagePath,
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3485FF),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 0),
                              minimumSize: Size(
                                  80, 30), // Set minimum size for the button
                            ),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
