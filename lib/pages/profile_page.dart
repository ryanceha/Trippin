import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF3485FF),
      body: Column(
        children: [
          Container(
            color: Color(0xFF3485FF),
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
                        child: SvgPicture.asset('lib/images/profile/whiteBack.svg'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the children horizontally
                  children: [
                    Image.asset(
                      'lib/images/profile/profileIcon.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Daniel Christopher',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity, // Makes the white container take full width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.person,
                        initialValue: 'Aryo Binatang Prabowo',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.email,
                        initialValue: 'aryomelati@gmail.com',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.phone,
                        initialValue: '0895359781477',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.calendar_today,
                        initialValue: '26-11-2002',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.person_outline,
                        initialValue: 'Pria',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProfileInputField(
                        icon: Icons.credit_card,
                        initialValue: '3790705164',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Edit Password',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14, // Adjusted font size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14, // Adjusted font size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {
  final IconData icon;
  final String initialValue;

  const ProfileInputField({
    super.key,
    required this.icon,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: initialValue),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusted padding
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 14, // Adjusted font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
