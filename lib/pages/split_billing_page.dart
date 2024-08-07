import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trippin/pages/billing_page.dart';

class SplitBilling extends StatefulWidget {
  final String tripTitle;
  final String tripImagePath;

  const SplitBilling(
      {Key? key, required this.tripTitle, required this.tripImagePath});

  @override
  State<SplitBilling> createState() => _SplitBillingState();
}

class _SplitBillingState extends State<SplitBilling> {
  String? _selectedPerson;

  final List<BillItem> _billItems = [
    BillItem(name: "Bebek Panggang", price: 150000, quantity: 3),
    BillItem(name: "Nasi Goreng", price: 50000, quantity: 2),
    BillItem(name: "Es Teh Manis", price: 10000, quantity: 5),
  ];

  void _toggleSelected(BillItem item) {
    setState(() {
      item.isSelected = !item.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Split Bill',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                textAlign: TextAlign.start,
                "Assign you and your friends to the items",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD9D9D9)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: _personPicker(),
            ),
            Expanded(
              child: ListView.builder(
                // set the height
                itemCount: _billItems.length,
                itemBuilder: (context, index) {
                  return _billDetails(_billItems[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "450,000",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service charge",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discounts",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Others",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "450,000",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            _splitBillButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Color(0xFF3485FF),
        child: SvgPicture.asset(
          'lib/images/split_billing/percent.svg',
          color: Colors.white,
          width: 30,
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget _billDetails(BillItem item) {
    return GestureDetector(
      onTap: () => _toggleSelected(item),
      child: Container(
        decoration: BoxDecoration(
          color: item.isSelected
              ? Color(0xFF3485FF).withOpacity(0.5)
              : Color(0xFF9C9C9C).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: item.isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${item.price} x ${item.quantity}",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: item.isSelected
                            ? Colors.white.withOpacity(0.7)
                            : Color(0xFF525252),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // for loop in random 3 people
                        for (var img in [
                          'lib/images/split_billing/ryan.png',
                          'lib/images/split_billing/grace.png',
                          'lib/images/split_billing/ruth.png',
                          'lib/images/split_billing/aryo.png',
                        ])
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(img),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${item.price * item.quantity}",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: item.isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: item.isSelected
                    ? Colors.blue
                    : Colors.white.withOpacity(0.8),
                child: item.isSelected
                    ? Icon(
                        Icons.check, color: Colors.white,
                        // make the icon smaller
                        size: 14,
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _personPicker() {
    List<String> imagePaths = [
      'lib/images/split_billing/ryan.png',
      'lib/images/split_billing/grace.png',
      'lib/images/split_billing/ruth.png',
      'lib/images/split_billing/aryo.png',
    ];
    List<String> personName = [
      'You',
      'Grace Setiaputri',
      'Ruth Timorah',
      'Aryo Bintang Prabowo'
    ];
    return Wrap(
      spacing: 10,
      children: imagePaths.map((img) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPerson = img;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedPerson == img
                        ? Colors.blue
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 75,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  personName[imagePaths.indexOf(img)],
                  maxLines: 2,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: _selectedPerson == img
                        ? Color(0xFF3485FF)
                        : Color(0xFF525252),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }

  Widget _splitBillButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BillingPage(
                tripTitle: widget.tripTitle,
                tripImagePath: widget.tripImagePath,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xFF3485FF),
        ),
        child: Center(
          child: Text(
            "Split Bill!",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class BillItem {
  String name;
  int price;
  int quantity;
  bool isSelected;

  BillItem({
    required this.name,
    required this.price,
    required this.quantity,
    this.isSelected = false,
  });
}
