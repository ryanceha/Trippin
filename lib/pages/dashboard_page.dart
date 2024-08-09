import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/billing_page.dart';
import 'package:trippin/pages/expense_page.dart';
import 'package:trippin/pages/gallery_detail_page.dart';
import 'package:trippin/pages/home_page.dart';
import 'package:trippin/pages/itinerary_page.dart';
import 'package:trippin/pages/packing_list_page.dart';

class DashboardPage extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const DashboardPage(
      {Key? key, required this.tripTitle, required this.tripImagePath});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.tripImagePath),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  widget.tripTitle == 'Bali, 2024'
                      ? 'Bali'
                      : widget.tripTitle == 'Surabaya, 2024'
                          ? 'Surabaya'
                          : 'France',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _itineraryButton(
                                  context,
                                  'Itinerary',
                                  'lib/images/dashboard/list-menu/calendar.svg',
                                  widget.tripTitle,
                                  widget.tripImagePath),
                              const SizedBox(width: 10), // Gap between buttons
                              _itineraryButton(
                                  context,
                                  'Expense',
                                  'lib/images/dashboard/list-menu/expense.svg',
                                  widget.tripTitle,
                                  widget.tripImagePath),
                              const SizedBox(width: 10), // Gap between buttons
                              _itineraryButton(
                                  context,
                                  'Billing',
                                  'lib/images/dashboard/list-menu/billing.svg',
                                  widget.tripTitle,
                                  widget.tripImagePath),
                              const SizedBox(width: 10), // Gap between buttons
                              _itineraryButton(
                                  context,
                                  'Packing List',
                                  'lib/images/dashboard/list-menu/packing-list.svg',
                                  widget.tripTitle,
                                  widget.tripImagePath),
                              const SizedBox(width: 10), // Gap between buttons
                              _itineraryButton(
                                  context,
                                  'Albums',
                                  'lib/images/dashboard/list-menu/albums.svg',
                                  widget.tripTitle,
                                  widget.tripImagePath),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _mainCard(
                                    context,
                                    'Itinerary',
                                    Color(0xFFEFB949),
                                    2,
                                    widget.tripTitle,
                                    widget.tripImagePath),
                                const SizedBox(height: 20),
                                _mainCard(context, 'Expense', Color(0xFFE2305F),
                                    1, widget.tripTitle, widget.tripImagePath),
                                const SizedBox(height: 20),
                                _mainCard(context, 'Billing', Color(0xFF47712D),
                                    1, widget.tripTitle, widget.tripImagePath),
                                const SizedBox(height: 20),
                                PackingListCard(
                                  tripTitle: widget.tripTitle,
                                ),
                                const SizedBox(height: 20),
                                _albumCard(context, widget.tripTitle),
                              ],
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
          Positioned(
            top: 50,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: 15,
                height: 30,
                child: Image.asset('lib/images/dashboard/back.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _itineraryButton(BuildContext context, String name, String imagePath,
    String tripTitle, String tripImagePath) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFEEF5FB),
      elevation: 0,
      padding: const EdgeInsets.all(0),
      minimumSize: Size.zero, // Remove the minimum size constraint
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => name == 'Itinerary'
                ? ItineraryPage(
                    tripTitle: tripTitle,
                    tripImagePath: tripImagePath,
                  )
                : name == 'Expense'
                    ? ExpensePage(
                        tripTitle: tripTitle,
                        tripImagePath: tripImagePath,
                      )
                    : name == 'Billing'
                        ? BillingPage(
                            tripTitle: tripTitle,
                            tripImagePath: tripImagePath,
                          )
                        : name == 'Packing List'
                            ? PackingListPage(
                                tripTitle: tripTitle,
                              )
                            : DetailGalleryPage(
                                albumTitle: tripTitle == 'Bali, 2024'
                                    ? 'Bali'
                                    : tripTitle == 'Surabaya, 2024'
                                        ? 'Surabaya'
                                        : 'France',
                              )),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0XFF3485FF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                imagePath, // Update this path to your SVG asset
                width: 15,
                height: 15,
                color: Colors.white, // Ensure the SVG icon is visible
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0XFF3485FF),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _mainCard(BuildContext context, String title, Color color,
    int numberOfItineraries, String tripTitle, String tripImagePath) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (title == 'Itinerary') {
                            return ItineraryPage(
                              tripTitle: tripTitle,
                              tripImagePath: tripImagePath,
                            );
                          } else if (title == 'Expense') {
                            return ExpensePage(
                              tripTitle: tripTitle,
                              tripImagePath: tripImagePath,
                            );
                          } else if (title == 'Billing') {
                            return BillingPage(
                              tripTitle: tripTitle,
                              tripImagePath: tripImagePath,
                            );
                          } else if (title == 'Packing List') {
                            return PackingListPage(
                              tripTitle: tripTitle,
                            );
                          } else if (title == 'Album') {
                            return DetailGalleryPage(
                              albumTitle: tripTitle == 'Bali, 2024'
                                  ? 'Bali'
                                  : tripTitle == 'Surabaya, 2024'
                                      ? 'Surabaya'
                                      : 'France',
                            );
                          } else {
                            return HomePage();
                          }
                        },
                      ),
                    );
                  },
                  child: Image.asset(
                    'lib/images/dashboard/info.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 32),
            child: Column(
              children: List.generate(numberOfItineraries, (index) {
                return Column(
                  children: [
                    _itineraryCard(color, title),
                    SizedBox(height: 10),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

class PackingListCard extends StatefulWidget {
  final String tripTitle;

  PackingListCard({required this.tripTitle});

  @override
  _PackingListCardState createState() => _PackingListCardState();
}

class _PackingListCardState extends State<PackingListCard> {
  // Sample packing list with initial checked states
  final Map<String, bool> _packingList = {
    'Passport': true,
    'Tickets': true,
    'Sunglasses': false,
    'Clothes': false,
    'Toiletries': false,
    'Camera': false,
    'Charger': false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Packing list',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PackingListPage(
                            tripTitle: widget.tripTitle,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'lib/images/dashboard/info.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, right: 16, left: 16, bottom: 8),
              child: Container(
                height: 200, // Set a fixed height for the container
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: _packingList.keys.map((String key) {
                          return _customCheckboxListTile(
                              key, _packingList[key]!);
                        }).toList(),
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

  Widget _customCheckboxListTile(String title, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            setState(() {
              _packingList[title] = newValue!;
            });
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
        dense: true, // This reduces the height of the ListTile
      ),
    );
  }
}

Widget _albumCard(BuildContext context, String tripTitle) {
  // List of image path used
  List<String> imagePaths = [
    'lib/images/dashboard/album/1.jpg',
    'lib/images/dashboard/album/2.jpg',
    'lib/images/dashboard/album/3.jpg',
    'lib/images/dashboard/album/4.jpg',
    'lib/images/dashboard/album/5.jpg',
    'lib/images/dashboard/album/6.jpg',
    'lib/images/dashboard/album/7.jpg',
    'lib/images/dashboard/album/8.jpg',
    'lib/images/dashboard/album/9.jpg',
    'lib/images/dashboard/album/10.jpg',
  ];

  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Album',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailGalleryPage(
                                albumTitle: tripTitle == 'Bali, 2024'
                                    ? 'Bali'
                                    : tripTitle == 'Surabaya, 2024'
                                        ? 'Surabaya'
                                        : 'France',
                              )),
                    );
                  },
                  child: Image.asset(
                    'lib/images/dashboard/info.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 16,
              left: 16,
              bottom: 32,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: imagePaths.length, // Use the length of the image list
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              16), // Set the border radius here
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _itineraryCard(Color color, String title) {
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
          width: 15,
          height: 74,
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
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        title == 'Itinerary'
                            ? 'lib/images/dashboard/shop.svg'
                            : title == 'Expense'
                                ? 'lib/images/dashboard/food.svg'
                                : 'lib/images/dashboard/play.svg', // Update this path to your food SVG asset
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                        width: 8), // Add some spacing between the icon and text
                    Text(
                      // if the title is 'Itinerary' the text is 'Jalan-Jalan', if the title is 'Expense' the text is 'Makan Gelato', if the title is 'Billing', the text is 'Tiket Masuk Water Blaster'
                      title == 'Itinerary'
                          ? 'Jalan-Jalan'
                          : title == 'Expense'
                              ? 'Makan Gelato'
                              : 'Tiket Masuk Water Blaster',
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
                    const SizedBox(width: 4),
                    Center(
                      child: SvgPicture.asset(
                        'lib/images/dashboard/time.svg', // Update this path to your time SVG asset
                        width: 16,
                        height: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title == 'Itinerary'
                          ? '24 May 2024, 13:00 - 15:00'
                          : title == 'Expense'
                              ? '24 May 2024'
                              : 'You Own Daniel',
                      style: TextStyle(fontFamily: 'Inter'),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title == 'Billing' ? 'IDR 150,000' : '',
                      style: TextStyle(
                        color: Color(0xFF3485FF),
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
