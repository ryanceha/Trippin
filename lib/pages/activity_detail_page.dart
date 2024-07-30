import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityDetailPage extends StatefulWidget {
  const ActivityDetailPage({super.key});

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
            const SizedBox(height: 20),
            _detailCard(Color(0xFFE2305F), "Expense"),
            const Spacer(),
            // create bill button
          ],
        ),
      ),
    ));
  }

  Widget _detailCard(Color color, String title) {
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
            height: 200,
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
                    title == 'Expense'
                        ? 'Rp. 500.000'
                        : title == 'Itinerary'
                            ? 'Rp. 1.200.000'
                            : 'Rp. 4.000',
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
                        title == 'Itinerary'
                            ? '13:00 - 15:00'
                            : title == 'Expense'
                                ? '15:00 - 17:00'
                                : '18:00 - 19:00',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title == 'Expense' ? 'IDR 150,000' : '',
                        style: TextStyle(
                          color: Color(0xFF3485FF),
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black, // Customize the color
                        thickness: 2, // Customize the thickness
                        indent: 20, // Customize the indent
                        endIndent: 20, // Customize the end indent
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
