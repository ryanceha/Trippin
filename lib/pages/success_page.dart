import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:trippin/pages/home_page.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3485FF),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 278,
              width: 278,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/success/thumbnail.png"),
                  scale: 2,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Recommendation Trip has been added!",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "We have analyzed your results and successfully\ncreated your plan for your amazing trip !",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Inter', fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                  height: 55,
                  width: 300,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Back to Home",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3485FF)))),
            )
          ],
        )));
  }
}
