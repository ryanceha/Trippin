import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillingDetail extends StatefulWidget {
  const BillingDetail({super.key});

  @override
  State<BillingDetail> createState() => _BillingDetailState();
}

class _BillingDetailState extends State<BillingDetail>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isExpandedResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                    'Bill Details',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Sendok Bebek",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 18),
              ),
              Text(
                "Bill Created: 27/05/2024 11:11",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9C9C9C),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "IDR 450,000",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3485FF),
                ),
              ),
              const SizedBox(height: 30),
              // THIS ROW THAT CONTROLS THE LISTVIEW DROPDOWN
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PARTICIPANTS (4)",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF9C9C9C),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: SvgPicture.asset(
                        'lib/images/split_billing/chevron.svg',
                        height: 6,
                        width: 6,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: _isExpanded
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 250.0, // Adjust this as needed
                        ),
                        child: _participantsList(),
                      )
                    : Container(),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpandedResult = !_isExpandedResult;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL ITEMS",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF9C9C9C),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isExpandedResult ? 0.5 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: SvgPicture.asset(
                        'lib/images/split_billing/chevron.svg',
                        height: 6,
                        width: 6,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: _isExpandedResult
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 250.0, // Adjust this as needed
                        ),
                        child: _detailList(),
                      )
                    : Container(),
              ),
              const SizedBox(height: 10),
              _splitResult(),
              _confirmPaymentButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _participantsList() {
    List<Map<String, String>> participants = [
      {
        'name': 'Ryan Christian Henlin',
        'amount': 'IDR 112,500',
        'status': 'Bill Owner'
      },
      {'name': 'Grace Setiaputri', 'amount': 'IDR 112,500', 'status': 'Paid'},
      {'name': 'Ruth Timorah', 'amount': 'IDR 112,500', 'status': 'Paid'},
      {
        'name': 'Aryo Bintang Prabowo',
        'amount': 'IDR 100,000',
        'status': 'Not Paid'
      },
    ];

    List<String> imagePaths = [
      'lib/images/split_billing/ryan.png',
      'lib/images/split_billing/grace.png',
      'lib/images/split_billing/ruth.png',
      'lib/images/split_billing/aryo.png',
    ];

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final participant = participants[index];
        return ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                imagePaths.elementAt(index),
              ),
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant['name']!,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    participant['status']!,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: participant['status'] == 'Bill Owner'
                          ? Color(0xFF9C9C9C)
                          : Colors.transparent,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ]),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  participant['amount']!,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      color: participant['status'] == 'Not Paid'
                          ? Color(0xFFFF0000)
                          : Colors.black,
                      fontSize: 14),
                ),
                Text(
                  participant['status']!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: participant['status'] == 'Not Paid'
                        ? Color(0xFFFF0000)
                        : participant['status'] == 'Paid'
                            ? Color(0xFF3485FF)
                            : Colors.transparent,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget _detailList() {
    List<Map<String, String>> details = [
      {'name': 'Bebek Panggang', 'quantity': 'x 1', 'amount': 'IDR 112,500'},
      {'name': 'Nasi Goreng', 'quantity': 'x 2', 'amount': 'IDR 225,000'},
      {'name': 'Es Teh', 'quantity': 'x 4', 'amount': 'IDR 100,000'},
    ];

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            detail['name']!,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            detail['quantity']!,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF9C9C9C),
            ),
          ),
          trailing: Text(
            detail['amount']!,
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }

  Widget _splitResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ryan Christian Henlin’s total",
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bebek Panggang",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "x 1",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Color(0xFF9C9C9C),
                    ),
                  ),
                ],
              ),
              Text(
                "112,500",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _confirmPaymentButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: Color(0xFF3485FF),
        ),
        child: Center(
          child: Text(
            "Confirm Payment",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
